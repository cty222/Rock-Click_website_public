// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function create_midi_drum(context){
	var midi_drum = new Object();
	
	midi_drum.current_groove = null;
	midi_drum.current_bpm = 120;
	midi_drum.sound_pool = null;
	midi_drum.volume_gains = null;
	
	
	midi_drum.repeat_source = null;
	midi_drum.playing = false;
	midi_drum.source_array = [];
	midi_drum.repeat_timer = function(loop_time) {
		var empty = this.sound_pool.empty;
		var source = this.play_sound(empty, loop_time, 0);
		this.repeat_source = source;
		source.onended = function() {
			if (midi_drum.playing && midi_drum.repeat_source == source) {
				midi_drum.stop_playing(false);
				midi_drum.play_all(); 
			}
		}
		source.stop(loop_time - 0.01);
	}
	midi_drum.stop_playing = function(clean_flag) {
		midi_drum.playing = false;
		var play_list = midi_drum.source_array
		var index = 0;
		// last source stop might cause dead loop or twice repeat;
		for (; index < play_list.length - 1; index++) {
			if (play_list[index].start) {
				//iphone need stop time 0.
				play_list[index].stop(0);
			}
		}
		if (clean_flag) {
			play_list[index].onended = null;
		}
		midi_drum.source_array = [];
	}
	midi_drum.play_sound = function(buffer, time, volume) {
		var source = context.createBufferSource();
		var gain = context.createGain();
		var out_put = context.destination;
		source.buffer = buffer;
		source.connect(gain);
		gain.gain.value = volume;
		gain.connect(out_put);
		midi_drum.source_array.push(source);
		source.start(time);
		return source;
	}

	midi_drum.play_all = function() {
		this.playing = true;
		var kick = this.sound_pool.kick;
		var snare = this.sound_pool.snare;
		var hh_c = this.sound_pool.hh_c;
		var hh_o = this.sound_pool.hh_o;
		var sixteenth_note_interval = (60 / this.current_bpm) / 4;
		
		// We'll start playing the rhythm 100 milliseconds from "now"
		var startTime = context.currentTime + 0;

		var hh_volume = parseInt(this.volume_gains.hh.value) / 5;
		var sn_volume = parseInt(this.volume_gains.sn.value) / 5;
		var bd_volume = parseInt(this.volume_gains.bd.value) / 5;
		hh_volume *= hh_volume;
		sn_volume *= sn_volume;
		bd_volume *= bd_volume;
		// Play 4 bars of the following:
		for (var bar = 0; bar < 1; bar++) {
			var time = startTime + bar * 8 * sixteenth_note_interval;
			// Play the hi-hat every eighthh note.
			for (var i = 0; i < 16; ++i) {
				if (this.current_groove.hh_array.indexOf(i) >= 0) {
					if (i % 4 == 0) {
						this.play_sound(hh_o, time + i * sixteenth_note_interval, 0.02 * hh_volume);
					} else {
						this.play_sound(hh_c, time + i * sixteenth_note_interval, 0.02 * hh_volume);
					}
				}
				if (this.current_groove.bd_array.indexOf(i) >= 0) {
					this.play_sound(kick, time + i * sixteenth_note_interval, 1 * bd_volume);
				}
				if (this.current_groove.sn_array.indexOf(i) >= 0) {
					this.play_sound(snare, time + i * sixteenth_note_interval, 0.5 * sn_volume);
				}
			}
			this.repeat_timer(time + i * sixteenth_note_interval);
		}
	}
	return midi_drum;
}

class TimeSignature < ActiveRecord::Base
  has_many :grooves, class_name: 'Groove', foreign_key: "user_id"       
end

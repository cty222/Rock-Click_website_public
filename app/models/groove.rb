class Groove < ActiveRecord::Base
  belongs_to :user
  belongs_to :time_signature
  belongs_to :instrument_bundle
  belongs_to :groove_category
  belongs_to :groove_folder
end

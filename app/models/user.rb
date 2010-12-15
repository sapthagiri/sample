class User < ActiveRecord::Base
  has_many :class_information
  validates_presence_of :first_name, :last_name, :stony_brook_id, :host_institution
  #validates_presence_of :title, :class_number, :section_number, :day, :start_time, :stop_time
end

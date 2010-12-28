class ClassInformation < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :class_number
  validates_numericality_of :class_number, :only_integer => true, :message => "sholud be a number."
  validates_inclusion_of :class_number, :in => 10000..99999, :message => "sholud be 5 digit number."
  validates_presence_of :credits, :day, :start_time, :stop_time
end

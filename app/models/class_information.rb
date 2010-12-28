class ClassInformation < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :class_number
  validates_numericality_of :class_number, :only_integer => true, :greater_than_or_equal_to => 10000, :less_than_or_equal_to => 99999, :message => "should be 5 digit number."  
  validates_presence_of :credits, :day, :start_time, :stop_time
end

class User < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :stony_brook_id, :host_institution
end

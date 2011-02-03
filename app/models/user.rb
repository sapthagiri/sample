class User < ActiveRecord::Base
  has_many :class_information

  def self.search(search)
    if search
      find(:all, :conditions => ['first_name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end

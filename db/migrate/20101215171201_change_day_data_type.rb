class ChangeDayDataType < ActiveRecord::Migration
  def self.up
   change_column :class_informations, :day, :string
  end

  def self.down
    change_column :class_informations, :day, :date
  end
end

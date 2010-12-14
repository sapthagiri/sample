class CreateClassInformations < ActiveRecord::Migration
  def self.up
    create_table :class_informations do |t|
      t.column :title, :string
      t.column :class_number, :string
      t.column :section_number, :string
      t.column :day, :date
      t.column :credits, :integer
      t.column :start_time, :time
      t.column :stop_time, :time
      t.column :user_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :class_informations
  end
end

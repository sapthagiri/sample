class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string :last_name
      t.string :first_name
      t.integer :stony_brook_id
      t.string :host_institution

      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end

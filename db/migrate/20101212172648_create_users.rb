class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column :last_name, :string
      t.column :first_name, :string
      t.column :stony_brook_id, :string
      t.column :host_institution, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end

class CreateDebates < ActiveRecord::Migration
  def self.up
    create_table :debates do |t|
      t.text :topic
      t.integer :length

      t.timestamps
    end
  end

  def self.down
    drop_table :debates
  end
end

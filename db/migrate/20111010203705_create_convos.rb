class CreateConvos < ActiveRecord::Migration
  def self.up
    create_table :convos do |t|
      t.text :topic
      t.datetime :start_time
      t.datetime :end_time
      t.integer :current_turn

      t.timestamps
    end
  end

  def self.down
    drop_table :convos
  end
end

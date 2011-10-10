class CreateConvoUsers < ActiveRecord::Migration
  def self.up
    create_table :convo_users do |t|
      t.integer :user_id
      t.integer :convo_id
      t.boolean :creator

      t.timestamps
    end
  end

  def self.down
    drop_table :convo_users
  end
end

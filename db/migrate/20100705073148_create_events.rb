class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.text :description
      t.boolean :is_public
      t.interger :capacity

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end

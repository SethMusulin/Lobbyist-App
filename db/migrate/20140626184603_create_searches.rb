class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :state
      t.string :bill
      t.integer :user_id
      t.string :user_id
    end
    add_index :searches, :user_id
  end
end

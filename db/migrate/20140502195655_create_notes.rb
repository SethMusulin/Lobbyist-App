class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :note
      t.string :tag
      t.datetime :date
      t.timestamps
    end
  end
end


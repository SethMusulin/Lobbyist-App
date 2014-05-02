class RemoveDateColumn < ActiveRecord::Migration
  def change
    remove_column :notes, :date

  end
end

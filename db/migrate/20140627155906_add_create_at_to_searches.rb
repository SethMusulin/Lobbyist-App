class AddCreateAtToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :created_at, :datetime
  end
end

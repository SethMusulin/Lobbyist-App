class CreateFeatureRequests < ActiveRecord::Migration
  def change
    create_table :feature_requests do |t|
      t.string :feature
      t.timestamps
    end
  end
end

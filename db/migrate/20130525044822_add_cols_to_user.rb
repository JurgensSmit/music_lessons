class AddColsToUser < ActiveRecord::Migration
  def change
    add_column :users, :about, :text
    add_column :users, :image_url, :string
    add_column :users, :gplus_url, :string
    add_column :users, :rate, :decimal
    add_column :users, :location, :string
    add_column :users, :user_type, :string
  end
end

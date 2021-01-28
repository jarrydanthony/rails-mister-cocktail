class UpdateRequiredColumns < ActiveRecord::Migration[6.0]
  def change
    change_column :cocktails, :name, :string, null: false
    change_column :ingredients, :name, :string, null: false
    change_column :doses, :description, :string, null: false
  end
end

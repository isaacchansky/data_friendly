class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :rating
      t.string :domain
      t.text :description
      t.string :logo_url
      t.string :policy_url

      t.timestamps null: false
    end
  end
end

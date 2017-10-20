class CreateOrgs < ActiveRecord::Migration
  def change
    create_table :orgs do |t|
      t.string :name
      t.string :desc
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

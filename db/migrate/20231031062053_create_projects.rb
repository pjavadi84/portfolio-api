class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.string :link
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

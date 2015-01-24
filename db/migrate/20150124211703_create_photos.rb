class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title, null: false
      t.text :description
      t.references :user, null: false

      t.timestamps
    end
  end
end

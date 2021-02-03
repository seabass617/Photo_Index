class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.text :description
      t.references :album, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :index

      t.timestamps
    end
  end
end

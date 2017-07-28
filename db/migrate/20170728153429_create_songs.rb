class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.date :release
      t.string :url
      t.references :singer, foreign_key: true
      t.references :album, foreign_key: true
      t.references :genre, foreign_key: true
      t.integer :privacity

      t.timestamps
    end
  end
end

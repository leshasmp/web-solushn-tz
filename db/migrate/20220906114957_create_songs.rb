class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :length
      t.integer :filesize

      t.timestamps
    end
    add_index :songs, :title
  end
end

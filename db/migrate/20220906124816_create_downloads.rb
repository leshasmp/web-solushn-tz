class CreateDownloads < ActiveRecord::Migration[7.0]
  def change
    create_table :downloads do |t|
      t.references :song, null: false, foreign_key: true

      t.timestamps
    end
    add_index :downloads, :created_at
  end
end

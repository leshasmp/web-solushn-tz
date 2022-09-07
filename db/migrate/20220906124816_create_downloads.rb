class CreateDownloads < ActiveRecord::Migration[7.0]
  def change
    create_table :downloads do |t|
      t.references :song, null: false, foreign_key: true, index: true
      t.integer :count

      t.timestamps
    end
  end
end

class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.timestamp :release_date
      t.integer :genre
      t.string :image
      t.integer :external_id

      t.timestamps
    end
  end
end

class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.timestamp :releate_date
      t.integer :genre
      t.string :image

      t.timestamps
    end
  end
end

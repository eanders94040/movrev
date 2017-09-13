class CreateModelForMyApis < ActiveRecord::Migration[5.1]
  def change
    create_table :model_for_my_apis do |t|

      t.timestamps
    end
  end
end

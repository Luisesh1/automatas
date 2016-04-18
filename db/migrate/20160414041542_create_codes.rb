class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :titulo
      t.string :codigo

      t.timestamps null: false
    end
  end
end

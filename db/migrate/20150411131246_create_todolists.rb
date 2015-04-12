class CreateTodolists < ActiveRecord::Migration
  def change
    create_table :todolists do |t|
      t.string :thing
      t.string :status
      
      t.timestamps null: false
    end
  end
end

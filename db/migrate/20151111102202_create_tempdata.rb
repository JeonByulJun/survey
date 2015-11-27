class CreateTempdata < ActiveRecord::Migration
  def change
    create_table :tempdata do |t|
      t.text :temptitle
      t.integer :tempid
      t.timestamps null: false
    end
  end
end

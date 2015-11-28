class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.integer :questionaire_id
      t.text :pick
      t.integer :snum
      t.timestamps null: false
    end
  end
end

class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.integer :auser_id
      t.integer :question_id
      t.timestamps null: false
    end
  end
end

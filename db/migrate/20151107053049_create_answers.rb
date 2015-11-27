class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :auser_id
      t.integer :question_id
      t.integer :select
      t.timestamps null: false
    end
  end
end

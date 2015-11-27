class CreateQuestionaires < ActiveRecord::Migration
  def change
    create_table :questionaires do |t|
      
      t.integer :question_id
      t.text :option
      t.timestamps null: false
    end
  end
end

class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.references :chapter, index: true, foreign_key: true
      t.integer :correct_option_id, index: true
      t.string :type
      t.text :name
      t.timestamps
    end
  end
end

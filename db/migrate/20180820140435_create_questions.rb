class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :chapter_id
      t.integer :option_id
      t.string :type

      t.timestamps
    end
  end
end

class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.references :question, index: true, foreign_key: true
      t.string :name
      t.timestamps
    end

    create_table :options_questions do |t|
      t.belongs_to :option, index: true
      t.belongs_to :question, index: true
    end
  end
end

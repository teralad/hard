class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.references :exam, index: true, foreign_key: true
      t.string :name
      t.timestamps
    end
  end
end

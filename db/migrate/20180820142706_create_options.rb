class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.references :question, index: true, foreign_key: true
      t.text :name
      t.timestamps
    end
  end
end

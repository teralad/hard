class CreateChapters < ActiveRecord::Migration[5.1]
  def change
    create_table :chapters do |t|
      t.references :topic, index: true, foreign_key: true
      t.string :name
      t.timestamps
    end
  end
end

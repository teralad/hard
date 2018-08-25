class CreateJwToken < ActiveRecord::Migration[5.0]
    def change
      create_table :jw_tokens do |t|
        t.text :jti, null: false
        t.references :user, index: true
      end
    end
  end
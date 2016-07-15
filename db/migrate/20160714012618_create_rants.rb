class CreateRants < ActiveRecord::Migration
  def change
    create_table :rants do |t|
      t.text :rant
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

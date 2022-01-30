class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :title, limit: 80, null: false
      t.text :description, limit: 500, null: false
      t.boolean :completed, default: false
      t.integer :priority
      t.datetime :due_date

      t.timestamps
    end
  end
end

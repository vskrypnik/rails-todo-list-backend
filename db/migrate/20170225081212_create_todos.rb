class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.string :name, null: false, index: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end

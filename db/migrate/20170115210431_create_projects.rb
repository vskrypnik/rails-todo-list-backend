class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false, index: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

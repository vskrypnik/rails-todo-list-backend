class AddDoneColumnToTodos < ActiveRecord::Migration[5.0]
  def change
    add_column :todos, :done, :boolean, null: false, index: true, default: false
  end
end

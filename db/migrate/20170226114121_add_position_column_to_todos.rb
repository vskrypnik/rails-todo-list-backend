class AddPositionColumnToTodos < ActiveRecord::Migration[5.0]
  def change
    add_column :todos, :priority, :integer
  end
end

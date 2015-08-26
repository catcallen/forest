class AddProblemIdToSolution < ActiveRecord::Migration
  def change
    add_column :solutions, :problem_id, :integer
    add_index :solutions, :problem_id
  end
end

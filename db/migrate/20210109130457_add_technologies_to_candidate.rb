class AddTechnologiesToCandidate < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :technologies, :text, array: true, default: []
  end
end

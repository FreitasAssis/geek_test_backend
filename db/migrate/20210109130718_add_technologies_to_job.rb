class AddTechnologiesToJob < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :technologies, :text, array: true, default: []
  end
end

class CreateCandidates < ActiveRecord::Migration[5.2]
  def change
    create_table :candidates do |t|
      t.string :city
      t.text :experience

      t.timestamps
    end
  end
end

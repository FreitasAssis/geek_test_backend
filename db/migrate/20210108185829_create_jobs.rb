class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :city
      t.text :experience

      t.timestamps
    end
  end
end

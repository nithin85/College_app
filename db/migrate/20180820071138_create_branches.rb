class CreateBranches < ActiveRecord::Migration[5.2]
  def change
    create_table :branches do |t|
      t.integer :college_id
      t.string :branch_name

      t.timestamps
    end
  end
end

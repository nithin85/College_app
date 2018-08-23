class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.integer :branch_id
      t.string :student_name
      t.string :student_address
      t.integer :student_sem

      t.timestamps
    end
  end
end

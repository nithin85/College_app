class AddActiveRecordToColleges < ActiveRecord::Migration[5.2]
  def change
    add_column :colleges, :active_record, :boolean, default: true
  end
end

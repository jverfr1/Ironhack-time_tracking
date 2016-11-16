class CreateTimeEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :time_entries do |t|
      t.references :project, index:true
      t.integer  :hours
      t.integer  :minutes
      t.text     :comments
      t.datetime :data
      t.timestamps
    end
  end
end

class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.date :started_date
      t.date :finished_date
      t.integer :status

      t.timestamps
    end
  end
end

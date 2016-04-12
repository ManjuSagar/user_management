class Tasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.integer :assigned_by
      t.integer :assigned_to
    end
  end
end

class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.references :branch, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end

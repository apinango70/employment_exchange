class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :department
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

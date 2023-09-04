class CreateJobPostings < ActiveRecord::Migration[7.0]
  def change
    create_table :job_postings do |t|
      t.string :title
      t.string :department
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

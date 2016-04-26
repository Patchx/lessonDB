class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :grade
      t.string :subject
      t.string :state
      t.boolean :ese
      t.string :standards

      t.timestamps null: false
    end
  end
end

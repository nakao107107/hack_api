# frozen_string_literal: true

class CreateCaves < ActiveRecord::Migration[5.2]
  def change
    create_table :caves do |t|
      t.integer :course_id
      t.string :name
      t.text :image_url
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end

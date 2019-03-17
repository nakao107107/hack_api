# frozen_string_literal: true

class CreateDinners < ActiveRecord::Migration[5.2]
  def change
    create_table :dinners do |t|
      t.integer :course_id
      t.string :name
      t.text :image_url
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end

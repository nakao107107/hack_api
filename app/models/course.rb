# frozen_string_literal: true

class Course < ApplicationRecord
  has_one :lunch, class_name: 'Lunch', dependent: :destroy
  accepts_nested_attributes_for :lunch

  has_one :cafe, class_name: 'Cafe', dependent: :destroy
  accepts_nested_attributes_for :cafe

  has_one :dinner, class_name: 'Dinner', dependent: :destroy
  accepts_nested_attributes_for :dinner

  def basic_info
    {
      id: id,
      spot: {
        name: name,
        lat: lat,
        lng: lng
      },
      lunch: lunch.basic_info,
      cafe: cafe.basic_info,
      dinner: dinner.basic_info
    }
  end
end

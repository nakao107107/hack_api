# frozen_string_literal: true

class Dinner < ApplicationRecord
  belongs_to :course

  def basic_info
    {
      name: name,
      lat: lat,
      lng: lng,
      image_url: image_url
    }
  end
end

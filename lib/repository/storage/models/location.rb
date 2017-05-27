# frozen_string_literal: true

class Location < ActiveRecord::Base
  def as_hash
    {
      country: country,
      address: address
    }
  end
end

# frozen_string_literal: true

class Company < ActiveRecord::Base
  has_many :users
  belongs_to :location

  def as_hash
    company_hash = {
      name:       name,
      created_at: created_at,
      updated_at: updated_at
    }

    company_hash.merge(location.as_hash) unless location.nil?
    company_hash
  end
end

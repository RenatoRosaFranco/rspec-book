# frozen_string_literal: true

class Phone < ApplicationRecord
  self.table_name  = 'phones'
  self.primary_key = 'id'

  validates :phone_type,
            presence: true

  validates :phone_number,
            presence: true,
            uniqueness: { scope: [:contact_id] }

  belongs_to :contact
end

# frozen_string_literal: true

class Contact < ApplicationRecord
  self.table_name  = 'contacts'
  self.primary_key = 'id'

  has_many :phones, dependent: :destroy

  validates :firstname,
            presence: true

  validates :lastname,
            presence: true

  validates :email,
            presence: true,
            uniqueness: true

  def self.by_letter(letter)
    where('lastname LIKE ?', "#{letter}%").order(:lastname)
  end

  def full_name
    [firstname, lastname].join(' ')
  end
end

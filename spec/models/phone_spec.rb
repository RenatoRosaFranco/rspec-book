require 'rails_helper'

RSpec.describe Phone, type: :model do
  it 'does not allow duplicate phone number per contact' do
    contact = FactoryBot.create(:contact)
    
    FactoryBot.create(:home_phone, 
      phone_type: '(11) 97195-6599',
      contact: contact
    )

    mobile_phone = FactoryBot.build(:mobile_phone, 
      phone_type: '(11) 97195-6599', 
      contact: contact
    )

    mobile_phone.valid?
    expect(mobile_phone.errors[:phone_number]).to include('has already been taken')
  end

  it 'allows two contact to share a phone number' do
    FactoryBot.create(:home_phone)
    expect(FactoryBot.build(:home_phone, phone_number: "(11) 97195-6599")).to be_valid
  end
end

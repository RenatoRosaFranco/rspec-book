require 'rails_helper'

RSpec.describe Phone, type: :model do
  it 'does not allow duplicate phone number per contact' do
    contact = Contact.create(
        firstname: 'Renato',
        lastname: 'Franco',
        email: 'renato-franco@gmail.com'
    )

    contact.phones.create(
        phone_type: 'home',
        phone_number: '(11) 997195-6599'
    )

    mobile_phone = contact.phones.build(
        phone_type: 'mobile',
        phone_number: '(11) 997195-6599'
    )

    mobile_phone.valid?
    expect(mobile_phone.errors[:phone_number]).to include('has already been taken')
  end

  it 'allows two contact to share a phone number' do
    contact = Contact.create(
        firstname: 'Joe',
        lastname:  'Tester',
        email: 'joetester@example.com'
    )

    contact.phones.create(
        phone_type: 'home',
        phone_number: '(11) 99621-6499'
    )

    other_contact = Contact.new
    other_phone = other_contact.phones.build(
        phone_type: 'home',
        phone_number: '(11) 99621-6499'
    )

    expect(other_phone).to be_valid
  end
end

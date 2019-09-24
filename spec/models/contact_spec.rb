# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  subject(:contact) { FactoryBot.build(:contact) }

  it 'has a valid factory' do
    expect(contact).to be_valid
  end

  it 'is a valid with a firstname, lastname and email' do
    expect(contact).to be_valid
  end

  it 'is invalid without a firstname' do
    contact.firstname = nil
    contact.valid?
    expect(contact.errors[:firstname]).to include("can't be blank")
  end

  xit 'is invalid without a lastname' do
    contact.lastname = nil
    contact.valid?
    expect(contact.errors[:lastname]).to include("can't be blank")
  end
  
  it 'is invalid without an email address' do
    contact.email = nil
    contact.valid?
    expect(contact.errors[:email]).to include("can't be blank")
  end
  
  it 'is invalid with a duplicate email address' do
    contact  = FactoryBot.create(:contact)
    john_doe = FactoryBot.build(:contact, firstname: 'John', lastname: 'Doe 2')
    john_doe.valid?
    expect(john_doe.errors[:email]).to include('has already been taken')
  end
  
  it 'returns a contact\'s full name as a string' do
    expect(contact.full_name).to eq('John Doe')
  end

  describe 'filter last name by letter' do
    subject(:smith) { FactoryBot.create(:smith) }
    subject(:jones) { FactoryBot.create(:jones) }
    subject(:johnson) { FactoryBot.create(:johnson) }

    context 'matching letters' do
      it 'returns a sorted array of results that match' do
        expect(Contact.by_letter('J')).to eq([johnson, jones])
      end
    end

    context 'non-matching letters' do
      it 'omits results that do not match' do
        expect(Contact.by_letter('J')).not_to include(smith)
      end
    end
  end
end

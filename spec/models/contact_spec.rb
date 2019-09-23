# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:contact)).to be_valid
  end

  it 'is a valid with a firstname, lastname and email' do
    contact = FactoryBot.build(:contact)
    expect(contact).to be_valid
  end

  it 'is invalid without a firstname' do
    contact = Contact.new(firstname: nil)
    contact.valid?
    expect(contact.errors[:firstname]).to include("can't be blank")
  end
  it 'is invalid without a lastname' do
    contact = Contact.new(lastname: nil)
    contact.valid?
    expect(contact.errors[:lastname]).to include("can't be blank")
  end
  it 'is invalid without an email address' do
    contact = Contact.new(email: nil)
    contact.valid?
    expect(contact.errors[:email]).to include("can't be blank")
  end
  it 'is invalid with a duplicate email address' do
    john = Contact.create(firstname: 'John', lastname: 'Doe', email: 'johndoe@gmail.com')

    john_doe = Contact.new(firstname: 'John', lastname: 'Doe', email: 'johndoe@gmail.com')
    john_doe.valid?
    expect(john_doe.errors[:email]).to include('has already been taken')
  end
  it 'returns a contact\'s full name as a string' do
    contact = Contact.new(firstname: 'Renato', lastname: 'Franco')
    expect(contact.full_name).to eq('Renato Franco')
  end

  describe 'filter last name by letter' do
    before(:each) do
      @smith = Contact.create(
        firstname: 'John',
        lastname: 'Smith',
        email: 'jsmith@example.com'
      )

      @jones = Contact.create(
        firstname: 'Tim',
        lastname: 'Jones',
        email: 'tjones@example.com'
      )

      @johnson = Contact.create(
        firstname: 'John',
        lastname: 'Johnson',
        email: 'jjohnson@example.com'
      )
    end

    context 'matching letters' do
      it 'returns a sorted array of results that match' do
        expect(Contact.by_letter('J')).to eq([@johnson, @jones])
      end
    end

    context 'non-matching letters' do
      it 'omits results that do not match' do
        expect(Contact.by_letter('J')).not_to include(@smith)
      end
    end
  end
end

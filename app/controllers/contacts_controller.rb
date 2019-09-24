# frozen_string_literal: true

class ContactsController < ApplicationController
	before_action :set_contact, only: [:show, :edit, :update, :destroy]
	respond_to :html, :json, :js

	def index
		@contacts = Contact.all
		respond_with(@contacts)
	end

	def new
		@contact = Contact.new
		respond_with(@contact)
	end

	def show
		respond_with(@contact)
	end

	def create
		@contact = Contact.create(contact_params)
		respond_with(@contact)
	end

	def edit
		@contact.update(contact_params)
		respond_with(@contact)
	end

	def destroy
		@contact.destroy
		respond_with(@contact)
	end

	private

	def set_contact
		@contact = Contact.find(params[:id])
	end

	def contact_params
		params.require(:contact).permit(:firstname, :lastname, :email)
	end
end
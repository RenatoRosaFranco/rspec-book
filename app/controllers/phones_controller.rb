# frozen_string_literal: true

class PhonesController < ApplicationController
	before_action :set_phone, only: [:show, :edit, :update, :destroy]
	respond_to :html, :json, :js

	def index
		@phones = Phone.all
		respond_with(@phones)
	end

	def new
		@phone = Phone.new
		respond_with(@phone)
	end

	def show
		respond_with(@phone)
	end

	def create
		@phone = Phone.create(phone_params)
		respond_with(@phone)
	end

	def edit
		@phone.update(phone_params)
		respond_with(@phone)
	end

	def destroy
		@phone.destroy
		respond_with(@phone)
	end

	private

	def set_phone
		@phone = Phone.find(params[:id])
	end

	def phone_params
		params.require(:phone).permit(:phone_type, :phone_number, :contact_id)
	end
end
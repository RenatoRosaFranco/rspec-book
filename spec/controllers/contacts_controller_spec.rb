require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
	describe 'GET #index' do
		context 'with params [:letter]' do
			it 'populates an array of contacts starting with letter' do

			end
			it 'render the :index template' do

			end
		end

		context 'without params [:letter]' do
			it 'populates an array of all contacts' do

			end

			it 'renders the :index template' do

			end
		end
	end	

	describe 'GET #show' do
		it 'assigns the requested contact to @contact' do

		end

		it 'renders the :show template' do

		end
	end

	describe 'GET #new' do
		it 'assings a new Contact to @contact' do

		end
		
		it 'renders the :new template' do

		end
	end

	describe 'GET #edit' do
		it 'assings the requested contact to @contact' do

		end
		
		it 'renders the :edit template' do

		end
	end

	describe 'POST #create' do
		context 'with valid attributes' do
			it 'saves the new contact in the database' do

			end
			it 'redirects to contacts#show' do

			end
		end

		context 'with invalid attributes' do
			it 'doest not save the new contact in the database' do

			end

			it 're-renders the :new template' do

			end
		end
	end

	describe 'PATCH #update' do
		context 'with valid attributes' do
			it 'updates the contact in the database' do

			end
			it 'redirects to the contact' do

			end
		end

		context 'with invalid attributes' do
			it 'does not update the contact' do

			end
			it 're-renders the :edit template' do

			end
		end
	end

	describe 'DELETE #destroy' do
		it 'deletes the contact from the database' do

		end
		it 'redirects to users#index' do

		end
	end 
end

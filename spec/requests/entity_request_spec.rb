require 'rails_helper'

RSpec.describe Entity, type: :request do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.create(
      name: 'Leopard',
			email: 'leopard@gmail.com',
			password: '122334',
			password_confirmation: '122334'
		)

		@group = Group.create(
			name: 'Outing',
			icon: 'outings.jpg',
			users_id: @user.id
		)

    @entity = Entity.create(
			name: 'Snacks',
			amount: 40,
			users_id: @user.id,
			group_id: @group.id
		)
    sign_in @user
  end

  describe 'GET /index' do
    before :each do
      get group_path(@group.id)
    end

    it 'returns a successful status' do
      expect(response).to have_http_status(200)
    end

    it 'renders the show page' do
      expect(response).to render_template('show')
    end

    it 'render exact text on page' do
      expect(response.body).to include('Snacks')
    end
  end
end

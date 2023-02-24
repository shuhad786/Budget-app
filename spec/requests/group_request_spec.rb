require 'rails_helper'

RSpec.describe Group, type: :request do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.create(
      name: 'Tiger',
      email: 'tiger@gmail.com',
      password: '122334',
      password_confirmation: '122334'
    )
    @group = Group.create(
      name: 'Cars',
      icon: 'cars.jpg',
      users_id: @user.id
    )
  end

  describe 'GET /index' do
    before :each do
      sign_in @user
      get groups_path
    end

    it 'returns a successful status' do
      expect(response).to have_http_status(200)
    end

    it 'renders the index page' do
      expect(response).to render_template('index')
    end

    it 'render exact text on page' do
      expect(response.body).to include('Cars')
    end
  end
end

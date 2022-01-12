require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'should return 200 response' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'should render index template correctly template ' do
      get users_path
      expect(response).to render_template(:index)
    end

    it '' do
      get users_path
      expect(response.body).to include('Users')
    end
  end
end

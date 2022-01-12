require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
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

  describe 'GET #show' do
    before(:each) { get user_path id: 32 }
    it 'should return 200 response' do
      expect(response).to have_http_status(200)
    end

    it 'should render the show template ' do
      expect(response).to render_template(:show)
    end

    it 'should include the word Single User' do
      expect(response.body).to include('Single User')
    end
  end

end

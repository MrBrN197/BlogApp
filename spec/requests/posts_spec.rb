require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user = User.new(name: 'matt', email: 'matt@test.com', password: 'matt123')
    @user.skip_confirmation!
    @user.save!
  end

  describe 'GET #index' do
    before(:each) { get user_posts_path(@user) }
    it 'should return correct response' do
      expect(response).to have_http_status(200)
    end
    it 'should render the correct template' do
      expect(response).to render_template(:index)
    end
    it 'should have the text Posts' do
      expect(response.body).to include('Number of posts')
    end
  end

  describe 'GET #index' do
    before(:each) { get user_post_path user_id: 4, id: 1 }
    it 'should return correct response' do
      expect(response).to have_http_status(200)
    end
    it 'should render the correct template' do
      expect(response).to render_template(:show)
    end
    it 'should have the text Posts' do
      expect(response.body).to include('Save')
    end
  end
end

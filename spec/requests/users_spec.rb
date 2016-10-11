require 'rails_helper'

RSpec.describe 'users', type: :request do
  include RequestHelper

  describe 'GET /v1/users' do
    let!(:users) { create_list(:user, 3) }

    it 'returns user resources' do
      get '/v1/users', params, env
      expect(response).to have_http_status(200)
    end
  end
end

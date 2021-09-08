require 'rails_helper'

RSpec.describe "Hotels", type: :request do
  # initialize test data
  let!(:hotels) { create_list(:hotel, 5) }
  let!(:hotel_id) { hotels.first.id }
  let(:user) { FactoryBot.create(:user, username: 'myusername', password: 'password') }
  # Test suite for GET /hotel
  describe 'GET /hotels' do
    # make HTTP get request before each example
    before { get '/hotels', headers: { 'Authorization' => AuthenticationTokenService.call(user.id) }  }
    it 'returns hotels' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for DELETE /hotel/:id
  describe 'DELETE /hotels/:id' do
    before { delete "/hotels/#{hotel_id}", headers: { 'Authorization' => AuthenticationTokenService.call(user.id) } }
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

  describe 'GET /hotels/:id' do
    before { get "/hotels/#{hotel_id}", headers: { 'Authorization' => AuthenticationTokenService.call(user.id) } }
    context 'when hotel exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
      it 'returns the hotel item' do
        expect(json['id']).to eq(hotel_id)
      end
    end
    # context 'when hotel does not exist' do
    #   let(:hotel_id) { 0 }
    #   it 'returns status code 404' do
    #     expect(response.body).to include("Couldn't find Hotel with 'id'=0")
    #   end
    #   it 'returns a not found message' do
    #     expect(response.body).to include("Couldn't find hotel with 'id'=0")
    #   end
    # end
  end

  describe 'POST /hotels/:id' do
    let(:valid_attributes) do
      { title: 'Hotel name', description: 'Hotel description', image_url: 'image.png'}
    end
    context 'when request attributes are valid' do
      before { post '/hotels', params: valid_attributes, headers: { 'Authorization' => AuthenticationTokenService.call(user.id) } }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
    context 'when an invalid request' do
      before { post '/hotels', params: {}, headers: { 'Authorization' => AuthenticationTokenService.call(user.id) } }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      it 'returns a failure message' do
        expect(response.body).to include("can't be blank")
      end
    end
  end
end

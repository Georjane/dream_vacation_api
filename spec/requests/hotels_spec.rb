require 'rails_helper'

RSpec.describe "Hotels", type: :request do
  # initialize test data
  let!(:hotels) { create_list(:hotel, 5) }
  let!(:hotel_id) { hotels.first.id }

  # Test suite for GET /hotel
  describe 'GET /hotels' do
    # make HTTP get request before each example
    before { get '/hotels' }
    it 'returns hotels' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
  # Test suite for POST /hotel
  describe 'POST /hotel' do
    # valid payload
    let(:valid_name) { { title: 'Hotel Name', description: 'What a nice hotel', image_url: 'image.png' } }
    context 'when the request is valid' do
      before { post '/hotels', params: valid_name }
      it 'creates a hotel' do
        expect(json['title']).to eq('Hotel Name')
      end
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
    context 'when the request is invalid' do
      before { post '/hotels', params: { title: '', description: 'What a nice hotel', image_url: 'image.png' } }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      it 'returns a validation failure message' do
        expect(response.body)
      .to include("is too short (minimum is 3 characters)")
      end
    end
  end
  # Test suite for DELETE /hotel/:id
  describe 'DELETE /hotels/:id' do
    before { delete "/hotels/#{hotel_id}" }
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

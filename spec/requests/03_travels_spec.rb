require 'rails_helper'

RSpec.describe "Travels", type: :request do
  describe "POST / travel" do
    let!(:params) { {
      "email":"brandonscb95@gmail.com",
      "latitude":3.451647,
      "longitude":-76.531982
    } }
    let!(:paramsTerminateTravel) { {
      "idTravel": 1,
      "latitude":3.883047,
      "longitude":-77.019722
    } }
    it "post create travel" do
      post '/api/v1/travels/init', params: params
      expect(response).to have_http_status(201)
    end
    it "put terminate travel" do
      put '/api/v1/travels/terminate', params: paramsTerminateTravel
      expect(response).to have_http_status(200)
    end
  end
end

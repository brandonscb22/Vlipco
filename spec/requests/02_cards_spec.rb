require 'rails_helper'

RSpec.describe "Cards", type: :request do
  describe "POST / card" do
    let!(:params) { {
      "card":{
        "number": "4242424242424242",
        "exp_month": "06",
        "exp_year": "29",
        "cvc": "123",
        "card_holder": "Pedro Pérez"
      },
      "email": "brandonscb95@gmail.com"
    } }
    it "post card success" do
      post '/api/v1/cards', params: params
      expect(response).to have_http_status(201)
    end
    it "post card failed" do
      post '/api/v1/cards', params: params.delete("email")
      expect(response).to have_http_status(400)
    end
  end
  describe "GET /cards" do
    it "get card failed" do
      get '/api/v1/cards'
      expect(response).to have_http_status(400)
    end
    it "get card success" do
      get '/api/v1/cards?email=brandonscb95@gmail.com'
      expect(response).to have_http_status(200)
    end
  end
end

require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "POST / users" do
    let!(:paramsUserRiver) { {
      "name": "brandon",
      "lastName": "lopez",
      "email": "brandonscb95@gmail.com",
      "phone": "+573107394292",
      "typeUser": "R"
    } }
    let!(:paramsUserDriver) { {
      "name": "brandon",
      "lastName": "lopez",
      "email": "brandonslc95@gmail.com",
      "phone": "+573107394292",
      "typeUser": "D"
    } }
    it "get user rider success" do
      post '/api/v1/users', params: paramsUserRiver
      expect(response).to have_http_status(201)
    end
    it "get user driver success" do
      post '/api/v1/users', params: paramsUserDriver
      expect(response).to have_http_status(201)
    end
  end
end

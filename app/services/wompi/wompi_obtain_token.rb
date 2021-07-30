require 'rest-client'
require 'json'
class Wompi::WompiObtainToken < ApplicationService
  def initialize
    @url = Rails.application.credentials.WOMPI_URL + '/merchants/' + Rails.application.credentials.WOMPI_PUB
  end

  def call
    res = RestClient.get(@url)
    body = JSON.parse(res, { symbolize_names: true })
    body
  end
end
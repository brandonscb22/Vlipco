require 'rest-client'
require 'json'
class Wompi::WompiRegisterCard < ApplicationService
  attr_reader :message

  def initialize(body)
    @url = Rails.application.credentials.WOMPI_URL + '/tokens/cards'
    @body = body
  end

  def call
    res = RestClient.post(@url, @body.to_json, {:Authorization => 'Bearer ' + Rails.application.credentials.WOMPI_PUB})
    body = JSON.parse(res, { symbolize_names: true })
    body
  end
end
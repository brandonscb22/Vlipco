require 'rest-client'
require 'json'
class Wompi::WompiRegisterCard < ApplicationService
  attr_reader :message

  def initialize(body)
    @url = 'https://sandbox.wompi.co/v1/tokens/cards'
    @body = body
  end

  def call
    res = RestClient.post(@url, @body.to_json, {:Authorization => 'Bearer pub_test_7S3GeMXFwECiUQCIi73VfG2T5Mlstx7U'})
    body = JSON.parse(res, { symbolize_names: true })
    body
  end
end
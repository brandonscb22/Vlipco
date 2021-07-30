require 'rest-client'
require 'json'
class Wompi::WompiObtainToken < ApplicationService
  def initialize
    @url = 'https://sandbox.wompi.co/v1/merchants/pub_test_7S3GeMXFwECiUQCIi73VfG2T5Mlstx7U'
  end

  def call
    res = RestClient.get(@url)
    body = JSON.parse(res, { symbolize_names: true })
    body
  end
end
require 'rest-client'
require 'json'
class Wompi::WompiObtainToken < ApplicationService
  def initialize
    puts ENV['WOMPI_URL']
    @url = 'https://sandbox.wompi.co/v1/merchants/pub_test_7S3GeMXFwECiUQCIi73VfG2T5Mlstx7U'
    @headers = {
      'content-type': "application/json",
      'x-apikey': "-------",
      'cache-control': "no-cache"
    }
  end

  def call
    res = RestClient.get(@url, @headers)
    body = JSON.parse(res, { symbolize_names: true })
    body
  end
end
require 'rest-client'
require 'json'
class Wompi::WompiCreateTransaction < ApplicationService
  def initialize
    @url = Rails.application.credentials.WOMPI_URL + '/merchants/' + ENV['WOMPI_PUB']
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
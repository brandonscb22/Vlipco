require 'rest-client'
require 'json'
class Wompi::WompiSaveCard < ApplicationService
  attr_reader :message

  def initialize(body)
    @url = 'https://sandbox.wompi.co/v1/payment_sources'
    @body = body
  end

  def call
    res = RestClient.post(@url, @body.to_json, {:Authorization => 'Bearer prv_test_anrqiY9dtPzhBZgibvT3NPBDcY3ErcFO'})
    body = JSON.parse(res, { symbolize_names: true })
    body
  end
end
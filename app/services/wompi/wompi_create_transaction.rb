require 'rest-client'
require 'json'
class Wompi::WompiCreateTransaction < ApplicationService
  def initialize(body)
    @url = Rails.application.credentials.WOMPI_URL + '/transactions'
    @body = body
    @params = {}
    @params[:amount_in_cents] = @body[:amountInCents].to_i
    @params[:currency] = @body[:currency]
    @params[:customer_email] = @body[:customerEmail]
    @params[:payment_method] = @body[:paymentMethod]
    @params[:reference] = @body[:reference]
    @params[:payment_source_id] = @body[:paymentSourceId]
  end

  def call
    puts @url
    puts @params.to_json
    res = RestClient.post(@url, @params.to_json ,{content_type: :json, accept: :json,:Authorization => 'Bearer ' + Rails.application.credentials.WOMPI_PRV})
    body = JSON.parse(res, { symbolize_names: true })
    body
  end
end
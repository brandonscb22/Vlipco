module API
  class Base < Grape::API
    mount ApplicationController
    mount API::V1::Base
  end
end
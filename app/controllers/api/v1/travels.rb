require 'georuby'
module API
  module V1
    class Travels < Grape::API
      include API::V1::Defaults
      travelService = TravelService.new
      resource :travels do
        desc "Create travels"
        params do
          requires :email, type: String, desc: "ID of the travel"
        end
        get "" do
          travelService.getAll
        end

        desc "Init travel"
        params do
          requires :email, type: String
          requires :longitude, type: Float
          requires :latitude, type: Float
        end
        post "" do
          travelService.create(params)
        end

        desc "Return a travel"
        params do
          requires :id, type: String, desc: "ID of the travel"
        end
        put ":id" do
          travelService.get(params)
        end
      end
    end
  end
end
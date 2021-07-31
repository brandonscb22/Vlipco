require 'georuby'
module API
  module V1
    class Travels < Grape::API
      include API::V1::Defaults
      travelService = TravelService.new
      resource :travels do
        desc "Get all travels user"
        params do
          requires :email, type: String
        end
        get "" do
          travelService.getAll(params)
        end

        desc "Return a travel"
        params do
          requires :id, type: String, desc: "ID of the travel"
        end
        get ":id" do
          travelService.get(params)
        end

        desc "Init travel"
        params do
          requires :email, type: String
          requires :longitude, type: Float
          requires :latitude, type: Float
        end
        post "init" do
          travelService.create(params)
        end

        desc "Finish travel"
        params do
          requires :idTravel, type: String
          requires :longitude, type: Float
          requires :latitude, type: Float
        end
        put "terminate" do
          travelService.terminate(params)
        end
      end
    end
  end
end
module API
  module V1
    class Travels < Grape::API
      include API::V1::Defaults
      resource :travels do
        desc "Return all travels"
        get "" do
          Travel.all
        end
        desc "Return a travel"
        params do
          requires :id, type: String, desc: "ID of the travel"
        end
        get ":id" do
          Travel.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end
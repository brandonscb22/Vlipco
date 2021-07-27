module API
  module V1
    class Travels < Grape::API
      include API::V1::Defaults
      resource :travels do
        desc "Return all users"
        get "" do
          Travel.all
        end
        desc "Return a user"
        params do
          requires :id, type: String, desc: "ID of the user"
        end
        get ":id" do
          Travel.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end
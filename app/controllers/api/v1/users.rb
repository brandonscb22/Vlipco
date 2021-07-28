module API
  module V1
    class Users < Grape::API
      include API::V1::Defaults
      resource :users do
        desc "Return all users"
        get "" do
          User.all
        end
        desc "Return a user"
        params do
          requires :id, type: String, desc: "ID of the user"
        end
        get ":id" do
          User.where(id: permitted_params[:id]).first!
        end
        desc "Create a user"
        params do
          requires :name, type: String
          requires :lastName, type: String
          requires :email, type: String
          requires :phone, type: String
          requires :typeUser, type: String
        end
        post "" do
          return User.create(name: params['name'],lastName: params['lastName'], email: params['email'], phone: params['phone'], typeUser: params['typeUser'])
        end
      end
    end
  end
end
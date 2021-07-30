module API
  module V1
    class Users < Grape::API
      include API::V1::Defaults
      userService = UserService.new
      resource :users do
        desc "Return all users"
        get "" do
          userService.getAll
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
          userService.createUser(params)
        end
      end
    end
  end
end
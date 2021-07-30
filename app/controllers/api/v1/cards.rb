module API
  module V1
    class Cards < Grape::API
      include API::V1::Defaults
      cardService = CardService.new
      resource :cards do
        desc "Return all cards"
        params do
          requires :email, type: String
        end
        get "" do
          cardService.getAll(params)
        end
        desc "Save card wompi and save association in db"
        params do
          requires :card, type: JSON
          requires :email, type: String
        end
        post "" do
          cardService.create(params)
        end
      end
    end
  end
end
module API
  module V1
    class Cards < Grape::API
      include API::V1::Defaults
      resource :cards do
        desc "Return all cards"
        params do
          requires :email, type: String
        end
        get "" do
          # search user for email
          user = User.find_by(email: params['email'])
          if user
            cards = Card.where(user: user)
            return {
              success: true,
              data: cards,
              message: 'OK'
            }
          else
            status 404
            return {
              success: false,
              error: 'user ('+ params['email'] +') not found',
              message:'user not found'
            }
          end
        end
        desc "Save card wompi and save association in db"
        params do
          requires :card, type: JSON
          requires :email, type: String
        end
        post "" do
          # search user for email
          user = User.find_by(email: params['email'])
          if user
            # send info credit card
            wrt = Wompi::WompiRegisterCard.new(params['card'])
            body = wrt.call
            # token credit card obtain wompi
            tokenCard = body[:data][:id]
            wot = Wompi::WompiObtainToken.new
            body = wot.call
            # acceptance_token
            token = body[:data][:presigned_acceptance][:acceptance_token]
            requestSaveCard = {
              "type": "CARD",
              "token": tokenCard,
              "customer_email": params['email'],
              "acceptance_token": token
            }
            wsc = Wompi::WompiSaveCard.new(requestSaveCard)
            body = wsc.call
            idCard = body[:data][:id]
            # create association credit card -> user
            card = Card.create(token: tokenCard,typeCard: 'CARD',idCard:idCard,user: user)
            return {
              success: true,
              data: card,
              message: 'OK'
            }
          else
            status 404
            return {
              success: false,
              error: 'user ('+ params['email'] +') not found',
              message:'user not found'
            }
          end
        end
      end
    end
  end
end
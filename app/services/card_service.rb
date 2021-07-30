class CardService < ApplicationService

  def getAll(params)
    begin
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
    rescue => error
      p error.message
    end
  end

  def create(params)
    begin
      # search user for email
      user = User.find_by(email: params['email'])
      if user
        # send info credit card
        wrt = Wompi::WompiRegisterCard.new(params['card'])
        body = wrt.call
        if body[:status] === 'CREATED'
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
          return {
            success: false,
            error: 'card load failed',
            message:'card load failed'
          }
        end
      else
        status 404
        return {
          success: false,
          error: 'user ('+ params['email'] +') not found',
          message:'user not found'
        }
      end
    rescue => error
      p error.message
    end
  end

end
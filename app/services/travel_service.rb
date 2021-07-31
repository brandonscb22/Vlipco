class TravelService < ApplicationService

  def getAll(params)
    user = User.find_by(email: params[:email])
    travel = Travel.where(userRider: user)
    travel = travel.as_json
    puts travel
    {
      success: true,
      data: travel,
      message: 'OK'
    }
  end

  def get(params)
    Travel.where(id: params[:id]).first!
  end

  def create(params)
    # search user for email
    user = User.find_by(email: params['email'])
    if user
      puts user.id
      userDriver = User.find_by(typeUser: 'D')
      if userDriver
        puts userDriver.id
        factory = RGeo::Cartesian.factory
        # pointInit = Point.from_x_y(params['longitude'], params['latitude'])
        # puts pointInit
        travel = Travel.create(userRider:user, pointInit:[params['longitude'], params['latitude']], userDriver:userDriver, status:'IN_PROGRESS')
        {
          success: true,
          data: travel,
          message: 'OK'
        }
      else
        status 404
        {
          success: false,
          error: 'no driver found for user ('+ params['email'] +')',
          message:'driver not found'
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
  end

  def terminate(params)
    # search travel for id
    travel = Travel.find_by(id: params['idTravel'])
    if travel
      # add point finish
      travel[:pointFinish] = [params['longitude'], params['latitude']]
      travel[:updated_at] = DateTime.now
      travel[:status] = 'COMPLETED_PENDING_PAYMENT'
      travel.save
      # return distance in km
      distanceTravel = self.calculateDistance([travel[:pointInit][:y],travel[:pointInit][:x]],[params['latitude'],params['longitude']])
      priceDistance = distanceTravel * 1000
      differentMinutes = ((travel[:updated_at] - travel[:created_at])/ 1.minutes).to_i
      priceMinutes = differentMinutes * 200
      priceTotal = (priceDistance + priceMinutes + 3500).round(0)
      travel[:amount] = priceTotal
      travel.save
      user = User.find_by(id: travel[:userRider_id])
      if user
        card = Card.find_by(user: user)
        if card
          trx = Transaction.create(amountInCents:priceTotal*100,currency:'COP', customerEmail: user.email,paymentMethod: { "installments": 2 }, reference: 'vlipco' + DateTime.now.strftime('%Q'), paymentSourceId:card[:idCard], travel: travel)
          wct = Wompi::WompiCreateTransaction.new(trx)
          body = wct.call
          trx[:response] = body
          trx.save
          {
            success: true,
            data: trx,
            message: 'OK'
          }
        else
          throw :error, :message => {
            success: false,
            error: 'the rider ('+ user[:email] +') does not have an associated card',
            message:'the rider does not have an associated card'
          }, :status => 404
        end
      else
        throw :error, :message => {
          success: false,
          error: 'the user ('+ travel[:userRider] +') not found',
          message:'the user rider not found'
        }, :status => 404
      end
    else
      throw :error, :message => {
        success: false,
        error: 'travel (' + params['id'] + ') not found',
        message:'travel not found'
      }, :status => 404
    end
  end

  def calculateDistance(loc1, loc2)
    rad_per_deg = Math::PI/180  # PI / 180
    rkm         = 6371          # Earth radius in kilometers
    rm          = rkm * 1000    # Radius in meters

    dlat_rad    = (loc2[0]-loc1[0]) * rad_per_deg # Delta, converted to rad
    dlon_rad    = (loc2[1]-loc1[1]) * rad_per_deg

    lat1_rad    = loc1.map {|i| i * rad_per_deg }.first
    lat2_rad    = loc2.map {|i| i * rad_per_deg }.first

    a           = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c           = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    ((rm * c) / 1000).round(2) # Delta in km
  end
end
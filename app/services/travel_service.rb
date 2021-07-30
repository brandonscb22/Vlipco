class TravelService < ApplicationService

  def getAll(params)
    Travel.all
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

end
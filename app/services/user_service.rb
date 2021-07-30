class UserService < ApplicationService

  def getAll
    User.all
  end

  def createUser(params)
    begin
      user = User.create(name: params['name'],lastName: params['lastName'], email: params['email'], phone: params['phone'], typeUser: params['typeUser'])
      return {
        success: true,
        data: {
          user: user,
          railsENV: Rails.env,
          railsWompi: Rails.application.credentials.WOMPI_URL,
        },
        message: 'OK'
      }
    rescue ActiveRecord::RecordNotUnique
      return {
        success: false,
        error: 'user ('+ params['email'] +') already exists',
        message:'user already exists'
      }
    end
  end
end
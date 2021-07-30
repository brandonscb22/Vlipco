class UserService < ApplicationService

  def getAll
    User.all
  end

  def createUser(params)
    user = User.create(name: params['name'],lastName: params['lastName'], email: params['email'], phone: params['phone'], typeUser: params['typeUser'])
    {
      user: user,
      railsENV: Rails.env,
      railsWompi: Rails.application.credentials.WOMPI_URL,
    }
  end

end
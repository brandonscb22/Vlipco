class UserService < ApplicationService

  def getAll
    User.all
  end

  def createUser(params)
    User.create(name: params['name'],lastName: params['lastName'], email: params['email'], phone: params['phone'], typeUser: params['typeUser'])
  end

end
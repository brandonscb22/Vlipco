class UserService < ApplicationService

  def getAll
    users = User.all
    {
      success: true,
      data: users,
      message: 'OK'
    }
  end

  def createUser(params)
    begin
      user = User.create(name: params['name'],lastName: params['lastName'], email: params['email'], phone: params['phone'], typeUser: params['typeUser'], status: params['typeUser'] === 'D' ? 'AVAILABLE' : 'N/A')
      {
        success: true,
        data: user,
        message: 'OK'
      }
    rescue ActiveRecord::RecordNotUnique
      throw :error, :message => {
        success: false,
        error: 'user ('+ params['email'] +') already exists',
        message:'user already exists'
      }, :status => 400
    end
  end
end
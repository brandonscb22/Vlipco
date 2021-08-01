# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
userR1 = User.create(name: 'client 1',lastName: 'test', email: 'brandonscb95@gmail.com', phone: '+573107394292', typeUser: 'R', status: 'N/A')
userR2 = User.create(name: 'client 2',lastName: 'test', email: 'brandonscb92@gmail.com', phone: '+573107394292', typeUser: 'R', status: 'N/A')
userR3 = User.create(name: 'client 3',lastName: 'test', email: 'brandonscb93@gmail.com', phone: '+573107394292', typeUser: 'R', status: 'N/A')
userD1 = User.create(name: 'driver 1',lastName: 'lopez cardenas', email: 'brandonscb94@gmail.com', phone: '+573107394292', typeUser: 'D', status: 'AVAILABLE')
userD2 = User.create(name: 'driver 2',lastName: 'lopez cardenas', email: 'brandonscb91@gmail.com', phone: '+573107394292', typeUser: 'D', status: 'AVAILABLE')
userD3 = User.create(name: 'driver 3',lastName: 'lopez cardenas', email: 'brandonscb96@gmail.com', phone: '+573107394292', typeUser: 'D', status: 'AVAILABLE')
card1 = Card.create(token:'tok_test_12481_14Ba619378776c0bde567f68C0915bb8', typeCard:'CARD', idCard:15120, user:userR1)
card2 = Card.create(token:'tok_test_12481_14Ba619378776c0bde567f68C0915bb8', typeCard:'CARD', idCard:15120, user:userR2)
card3 = Card.create(token:'tok_test_12481_14Ba619378776c0bde567f68C0915bb8', typeCard:'CARD', idCard:15120, user:userR3)
travel1 = Travel.create(userRider:userR1, userDriver:userD1, status:'IN_PROGRESS', pointInit:[-76.531982,3.451647], created_at: DateTime.now)
travel1 = Travel.create(userRider:userR2, userDriver:userD2, status:'IN_PROGRESS', pointInit:[-76.531982,3.451647], created_at: DateTime.now)
travel1 = Travel.create(userRider:userR3, userDriver:userD3, status:'IN_PROGRESS', pointInit:[-76.531982,3.451647], created_at: DateTime.now)



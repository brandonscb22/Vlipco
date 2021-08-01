# DRIVER_APP

* Ruby version 3.0.0

* System dependencies
  * postgrest

* Project initialization
  * ``rake db:reset``
  * to start the project correctly you must request the following keys:
    * ``config/credentials/production.key``
    * ``config/credentials/development.key``
    * ``config/credentials/tes.key``
  * ``rails s``
* Test initialization
  * ``rake db:reset RAILS_ENV=test``
  * ``bundle exec rspec``

##Available methods:
###user create
URL: 
```
POST http://localhost:3000/api/v1/users
```
EXAMPLE BODY:
```json   
    {
        "name": "brandon",
        "lastName": "lopez",
        "email": "brandonscb95@gmail.com",
        "phone": "+573107394292",
        "typeUser": "R"
    }
```
###ASSOCIATE CARD
URL:
```
POST http://localhost:3000/api/v1/cards
```
EXAMPLE BODY:
```json   
    {
        "card":{
            "number": "4242424242424242",
            "exp_month": "06",
            "exp_year": "29",
            "cvc": "123",
            "card_holder": "Pedro Pérez"
        },
        "email": "brandonscb95@gmail.com"
    }
```

###START TRAVEL
URL:
```
POST http://localhost:3000/api/v1/travels/init
```
EXAMPLE BODY:
```json   
    {
        "email":"brandonscb95@gmail.com",
        "latitude":3.451647,
        "longitude":-76.531982
    }
```
###GET TRAVELS
URL:
```
GET http://localhost:3000/api/v1/travels?email=brandonscb95@gmail.com
```
EXAMPLE BODY:
```json   
    {
        "idTravel": 1,
        "latitude":3.883047,
        "longitude":-77.019722
    }
```

###FINISH TRAVEL
URL:
```
POST http://localhost:3000/api/v1/travels/terminate
```
EXAMPLE BODY:
```json   
    {
        "idTravel": 1,
        "latitude":3.883047,
        "longitude":-77.019722
    }
```
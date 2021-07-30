class Travel < ApplicationRecord
  belongs_to :userRider,class_name: "User", foreign_key: "userRider_id"
  belongs_to :userDriver,class_name: "User", foreign_key: "userDriver_id"

end

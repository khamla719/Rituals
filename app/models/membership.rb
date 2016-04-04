class Membership < ActiveRecord::Base
  belongs_to :user, :class_name => "User"
  belongs_to :family, :class_name => "User", :foreign_key => "family_id"

end

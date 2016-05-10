class User < ActiveRecord::Base
  has_secure_password
  has_many :memories
  has_many :memberships
  has_many :families, :through => :memberships, :dependent => :destroy

  validates :password, confirmation: true

  def add_family(member)
    self_member = Membership.new(user_id: self.id, family_id: member.id)
    if self_member.save
      p "User to New member DONE!"
    end
    member_self = Membership.new(user_id: member.id, family_id: self.id)
    if member_self.save
      p "Member Can see User DONE!"
    end
  end

  def remove_family(member)
    self_member = Membership.find_by(user_id: self.id, family_id: member.id)
    if self_member.delete
      p "Remove User to Family Member"
    end
    member_self = Membership.find_by(user_id: member.id, family_id: self.id)
    if member_self.delete
      p "Remove Family Member to User"
    end
  end

end

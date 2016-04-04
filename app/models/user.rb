class User < ActiveRecord::Base
  has_secure_password
  has_many :memories
  has_many :memberships
  has_many :families, :through => :memberships, :dependent => :destroy

  validates :password, confirmation: true

  def add_family(member)
    # binding.pry
    a = Membership.new(user_id: self.id, family_id: member.id)
    if a.save
      p "User to New member DONE!"
    end
    b = Membership.new(user_id: member.id, family_id: self.id)
    if b.save
      p "Member Can see User DONE!"
    end
  end

  def remove_family(member)
    # binding.pry
    a = Membership.find_by(user_id: self.id, family_id: member.id)
    if a.delete
      p "Remove User to Family Member"
    end
    b = Membership.find_by(user_id: member.id, family_id: self.id)
    if b.delete
      p "Remove Family Member to User"
    end

    def pending_family
      self.memberships.where(authorized: false)
    end

    def authorized_family
      self.memberships.where(authorized: true)
    end

  end
end
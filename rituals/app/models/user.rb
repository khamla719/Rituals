class User < ActiveRecord::Base
  has_secure_password
  has_many :memories
  has_many :memberships
  has_many :families, :through => :memberships, :dependent => :destroy
  # has_many :families, :foreign_key => "family_id", :class_name => "Membership", :dependent => :destroy

# same relationship as line 5
  # has_many :families, :through => :memberships, :dependent => :destroy

# pulls only authorized members
  # has_many :authorized_members, :through => :memberships, :source => :family, :conditions => [ "authorized = ?", true]

# pulls unauthorized members
  # has_many :unauthorized_members, :through => :memberships, :source => :family, :conditions => [ "authorized = ?", false]



  validates :password, confirmation: true

  def add_family(member)
    # binding.pry
    a = Membership.new(user_id: self.id, family_id: member.id)
    if a.save
      p "goot it"
    end
    b = Membership.new(user_id: member.id, family_id: self.id)
    if b.save
      p "got b done"
    end
  end
end

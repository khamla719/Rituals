class Memory < ActiveRecord::Base
  belongs_to :user

  def self.public
    Memory.where(["private = false"])
  end

  def self.private
    Memory.where(["private = true"])
  end
end

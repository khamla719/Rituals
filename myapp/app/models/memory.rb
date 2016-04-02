class Memory
  include Mongoid::Document
  field :title, type: String
  field :story, type: String
end

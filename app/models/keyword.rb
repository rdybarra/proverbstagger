class Keyword < ActiveRecord::Base
  has_many :keyword_associations
  has_many :verses, :through => :keyword_associations
end

class Verse < ActiveRecord::Base
  has_many :keyword_associations
  has_many :keywords, :through => :keyword_associations
end

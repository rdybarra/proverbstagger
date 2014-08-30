class KeywordAssociation < ActiveRecord::Base
  belongs_to :verse
  belongs_to :keyword
end

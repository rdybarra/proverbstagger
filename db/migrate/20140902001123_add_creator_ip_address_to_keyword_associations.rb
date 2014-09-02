class AddCreatorIpAddressToKeywordAssociations < ActiveRecord::Migration
  def change
    add_column :keyword_associations, :ip_address, :string
  end
end

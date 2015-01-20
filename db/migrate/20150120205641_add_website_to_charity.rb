class AddWebsiteToCharity < ActiveRecord::Migration
  def change
    add_column :charities, :website_url, :text
  end
end

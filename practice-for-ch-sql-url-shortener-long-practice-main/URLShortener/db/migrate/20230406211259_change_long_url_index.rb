class ChangeLongUrlIndex < ActiveRecord::Migration[7.0]
  def change
    remove_index :shortened_urls, :long_url
    add_index :shortened_urls, :long_url
  end
end

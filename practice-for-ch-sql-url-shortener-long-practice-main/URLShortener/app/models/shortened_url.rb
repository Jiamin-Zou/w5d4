# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord
    validates :long_url, :short_url, presence: true
    validates :short_url, uniqueness: true

    def self.random_code
        while true
            short = SecureRandom::urlsafe_base64
            return short unless ShortenedUrl.exists?(short_url: short)
        end
    end

    after_initialize :generate_short_url, if: :new_record?

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User
    


    private
    
    def generate_short_url
        self.short_url = ShortenedUrl.random_code unless self.short_url
    end
    
end

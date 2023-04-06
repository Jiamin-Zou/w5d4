# == Schema Information
#
# Table name: visits
#
#  id           :bigint           not null, primary key
#  short_url_id :integer          not null
#  visitor_id   :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Visit < ApplicationRecord
    validates :short_url_id, :visitor_id, presence: true
end

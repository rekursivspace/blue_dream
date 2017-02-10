# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  label_id   :integer
#

class Artist < ApplicationRecord
	belongs_to :label
	has_many :albums
end

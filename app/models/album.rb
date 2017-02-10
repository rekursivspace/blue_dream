# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string
#  catalog    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artist_id  :integer
#

class Album < ApplicationRecord
	belongs_to :artist
	has_many :tracks
end

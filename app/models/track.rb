# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  album_id   :integer
#  uuid       :string
#

class Track < ApplicationRecord
	belongs_to :album
end

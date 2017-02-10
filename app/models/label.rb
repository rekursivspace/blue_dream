# == Schema Information
#
# Table name: labels
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  uuid       :string
#

class Label < ApplicationRecord
	has_many :artists
	has_many :albums, through: :artists
end

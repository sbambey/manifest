# == Schema Information
#
# Table name: providers
#
#  id         :integer          not null, primary key
#  name       :text
#  website    :text
#  created_at :timestamp withou not null
#  updated_at :timestamp withou not null
#

class Provider < ActiveRecord::Base
	has_many :missions
end

# == Schema Information
#
# Table name: missions
#
#  id          :integer          not null, primary key
#  number      :integer
#  name        :text
#  launch_time :timestamp withou
#  teaser      :text
#  body        :text
#  coverage    :text
#  published   :boolean
#  launched    :boolean
#  user_id     :integer
#  provider_id :integer
#  created_at  :timestamp withou not null
#  updated_at  :timestamp withou not null
#

class Mission < ActiveRecord::Base
	belongs_to :provider
	belongs_to :user

	scope :published, -> { where(published: true) }

	scope :upcoming, -> { where("launch_time >= ?", Time.now+2.hours) }
	scope :completed, -> { where("launch_time < ?", Time.now+2.hours) }
end

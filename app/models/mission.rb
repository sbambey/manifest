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
#  user_id     :integer
#  provider_id :integer
#  created_at  :timestamp withou not null
#  updated_at  :timestamp withou not null
#  notes       :text
#  launch_date :date
#  net         :boolean
#

class Mission < ActiveRecord::Base
	belongs_to :provider
	belongs_to :user

	scope :published, -> { where(published: true) }

	scope :upcoming, -> { where("launch_time IS NULL OR launch_date > ? OR (launch_time >= ? AND launch_date <= ?)", Date.today, Time.zone.now-LAUNCH_CUTOFF, Date.today) }
	scope :completed, -> { where("launch_time IS NOT NULL AND launch_time < ? AND launch_date <= ?", Time.zone.now-LAUNCH_CUTOFF, Date.today) }

	#true when rocket has lifted off
	def launched?
		!launch_time.nil? && launch_time < Time.zone.now && launch_date <= Date.today
	end

	#true LAUNCH_CUTOFF hours after liftoff
	def outside_launch_window?
		!launch_time.nil? && launch_time < (Time.zone.now-LAUNCH_CUTOFF) && launch_date <= Date.today
	end

	private 

	LAUNCH_CUTOFF = 2.hours
	
end

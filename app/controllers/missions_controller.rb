class MissionsController < ApplicationController
	def index
		Time.zone = 'Eastern Time (US & Canada)'
		launch = Time.zone.parse('2015-06-26 11:09:00')

		diff = TimeDifference.between(launch, Time.now).in_each_component

		@day_diff = diff[:days].to_i
		@hour_diff = (diff[:hours]-diff[:days].to_i*24).to_i
		@minute_diff = (diff[:minutes]-diff[:hours].to_i*60).to_i
	end
end

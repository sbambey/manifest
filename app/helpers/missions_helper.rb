module MissionsHelper
	def time_diff(time)
		diff = TimeDifference.between(time, Time.now).in_each_component
		day_diff = diff[:days].to_i
		hour_diff = (diff[:hours]-diff[:days].to_i*24).to_i
		minute_diff = (diff[:minutes]-diff[:hours].to_i*60).to_i
		return "#{day_diff} days, #{hour_diff} hours, #{minute_diff} minutes"
	end
end

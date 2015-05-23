module MissionsHelper
	def time_diff(time)
		diff = TimeDifference.between(time, Time.now).in_each_component
		day_diff = diff[:days].to_i
		hour_diff = (diff[:hours]-diff[:days].to_i*24).to_i
		minute_diff = (diff[:minutes]-diff[:hours].to_i*60).to_i
		second_diff = (diff[:seconds]-diff[:minutes].to_i*60).to_i
		if day_diff > 1
			return "#{day_diff} days, #{hour_diff} hours, #{minute_diff} minutes"
		elsif hour_diff > 1
			return "#{hour_diff} hours, #{minute_diff} minutes, #{second_diff} seconds"
		else
			return "#{minute_diff} minutes, #{second_diff} seconds"
		end
	end
end

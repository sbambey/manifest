module MissionsHelper
	def time_diff(date, time)
		str = ""
		time_now = Time.now
		if !date.nil?
			day_diff = TimeDifference.between(date, time_now).in_days.to_i
			if day_diff > 0
				str << "#{day_diff} days "
			end
		end

		if !time.nil?
			diff = TimeDifference.between(time, time_now).in_each_component
			day_diff = diff[:days].to_i
			hour_diff = (diff[:hours]-diff[:days].to_i*24).to_i
			minute_diff = (diff[:minutes]-diff[:hours].to_i*60).to_i
			second_diff = (diff[:seconds]-diff[:minutes].to_i*60).to_i
			if str.blank?
				if hour_diff > 0
					str << "#{hour_diff} hours, #{minute_diff} minutes, #{second_diff} seconds"
				else
					str << "#{minute_diff} minutes, #{second_diff} seconds"
				end
			else
				str << "#{hour_diff} hours, #{minute_diff} minutes"
			end
		end
		return str
	end
end

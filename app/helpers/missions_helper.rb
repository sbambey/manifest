module MissionsHelper
	def time_diff(date, time)
		str = ""
		time_now = Time.zone.now
		date_today = Time.current.to_date
		if !date.nil?
			day_diff = (date-date_today).to_i
			if day_diff > 0
				str << "#{day_diff} #{day_diff > 1 ? 'days' : 'day'}"
			end
		end

		if !time.nil?
			diff = time - time_now
			day_diff = (diff/86400).to_i
			hour_diff = ((diff-day_diff*86400)/3600).to_i
			minute_diff = ((diff-hour_diff*3600-day_diff*86400)/60).to_i
			second_diff = (diff-day_diff*86400-hour_diff*3600-minute_diff*60).to_i
			if str.blank?
				if hour_diff > 0
					str << "#{hour_diff} #{hour_diff > 1 ? 'hours' : 'hour'}, 
					#{minute_diff} #{minute_diff > 1 ? 'minutes' : 'minute'}, 
					#{second_diff} #{second_diff > 1 ? 'seconds' : 'second'}"
				else
					str << "#{minute_diff} #{minute_diff > 1 ? 'minutes' : 'minute' }, 
					#{second_diff} #{second_diff > 1 ? 'seconds' : 'second'}"
				end
			else
				str << ", #{hour_diff} #{hour_diff > 1 ? 'hours' : 'hour'}, 
				#{minute_diff} #{minute_diff > 1 ? 'minutes' : 'minute' }"
			end
		end
		return str
	end
end

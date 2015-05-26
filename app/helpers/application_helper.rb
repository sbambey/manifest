module ApplicationHelper
	def flash_messages
		return "" if flash.empty?
		flash.each do |key, value|
			key = convert_if_devise_key(key)
	    return "<div class='alert alert-#{key}' role='alert'>#{value}</div>".html_safe
	  end
	end

	def convert_if_devise_key(key)
		if key == "notice"
			"success"
		elsif key == "alert"
			"danger"
		else
			key
		end
	end

	def active_link(controller, action = nil)
		if action
			if(params[:controller] == controller && params[:action] == action)
				return 'active'
			end
		else
			if(params[:controller] == controller)
				return 'active'
			end
		end
	end

	def time_diff(date, time)
		time_now = Time.zone.now
		date_today = Time.current.to_date
		str = ""
		if !date.nil? && time.nil?
			day_diff = (date-date_today).to_i
			if day_diff > 0
				str = "#{day_diff} #{day_diff > 1 ? 'days' : 'day'}"
			end
		elsif !time.nil?
			diff = time - time_now
			day_diff = (diff/86400).to_i
			hour_diff = ((diff-day_diff*86400)/3600).to_i
			minute_diff = ((diff-hour_diff*3600-day_diff*86400)/60).to_i
			second_diff = (diff-day_diff*86400-hour_diff*3600-minute_diff*60).to_i
			if day_diff > 0
				str = "#{day_diff} #{day_diff > 1 ? 'days' : 'day'}, 
				#{hour_diff} #{hour_diff > 1 ? 'hours' : 'hour'}, 
				#{minute_diff} #{minute_diff > 1 ? 'minutes' : 'minute'}"
			elsif hour_diff > 0
				str = "#{hour_diff} #{hour_diff > 1 ? 'hours' : 'hour'}, 
				#{minute_diff} #{minute_diff > 1 ? 'minutes' : 'minute'}, 
				#{second_diff} #{second_diff > 1 ? 'seconds' : 'second'}"
			else
				str = "#{minute_diff} #{minute_diff > 1 ? 'minutes' : 'minute' }, 
				#{second_diff} #{second_diff > 1 ? 'seconds' : 'second'}"
			end
		end
		return str
	end

	def markdown(text)
    renderer = Redcarpet::Render::HTMLTargetBlankRenderer.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end

  def markdown_line(text)
    renderer = Redcarpet::Render::HTMLWithoutBlockElements.new({
      :filter_html => true,
      :hard_wrap => true
    })
    markdown = Redcarpet::Markdown.new(renderer, {
      :autolink => true,
      :no_intra_emphasis => true
    })

    markdown.render(text).html_safe
  end
end

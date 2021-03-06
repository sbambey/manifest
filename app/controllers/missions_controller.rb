class MissionsController < ApplicationController
	before_action :authenticate_user!, except: [:show]

	def show
		@mission = Mission.friendly.find(params[:id])
		@mission_headline = wikipedia_service.test
		@wiki = wikipedia_service
	end

	def new_show
		@mission = Mission.friendly.find(params[:id])
	end

	def new
		@mission = Mission.new
	end

	def create
		@mission = current_user.missions.new(mission_params)
		if @mission.save
			flash[:success] = "Mission created successfully."
			redirect_to @mission
		else
			flash[:danger] = "Could not create mission."
			render 'new'
		end
	end

	def edit
		@mission = Mission.friendly.find(params[:id])
	end

	def update
		@mission = Mission.friendly.find(params[:id])
		if @mission.update_attributes(mission_params.merge(edit_history: @mission.edit_history.unshift("#{current_user.email} at #{Time.zone.now}")))
			flash[:success] = "Mission updated successfully."
			redirect_to @mission
		else
			flash[:danger] = "Could not update mission."
			render 'edit'
		end
	end

	private

	def mission_params
		p = params.require(:mission).permit(:number, :name, :wikipedia_article, :launch_location, :launch_time, :net, :teaser, :body, :published, :notes, :logo, :provider_id, attachments_attributes: attachments_attributes)
  	if !p['launch_time(1i)'].blank?
  		p['launch_date(1i)'] = p['launch_time(1i)']
  		p['launch_date(2i)'] = p['launch_time(2i)']
  		p['launch_date(3i)'] = p['launch_time(3i)']
  	end
  	if p['launch_time(4i)'].blank?
			p['launch_time(1i)'] = ''
			p['launch_time(2i)'] = ''
			p['launch_time(3i)'] = ''
		end
		return p
  end

  def attachments_attributes
  	a = [:file, :description, :source_name, :source_link, :_destroy]
  	if action_name == "update"
  		a.unshift(:id)
  	end
  	return a
  end

  def wikipedia_service
  	WikipediaService.new(name: @mission.name)
  end
end

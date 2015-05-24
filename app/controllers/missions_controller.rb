class MissionsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :completed, :show]

	def index
		@missions = Mission.published.upcoming.order(number: :asc)
	end

	def completed
		@missions = Mission.published.completed.order(number: :desc)
	end

	def new
		@mission = Mission.new
	end

	def create
		@mission = current_user.missions.new(mission_params)
		if @mission.save
			flash[:success] = "Mission created successfully."
			redirect_to root_path
		else
			flash[:danger] = "Could not create mission."
			render 'new'
		end
	end

	def edit
		@mission = Mission.find(params[:id])
	end

	def update
		@mission = Mission.find(params[:id])
		if @mission.update_attributes(mission_params)
			flash[:success] = "Mission updated successfully."
			if @mission.within_launch_window?
				redirect_to root_path
			else
				redirect_to completed_missions_path
			end
		else
			flash[:danger] = "Could not update mission."
			render 'edit'
		end
	end

	private

	def mission_params
		p = params.require(:mission).permit(:number, :name, :launch_time, :launch_date, :net, :teaser, :body, :launched, :published, :coverage, :notes, :provider_id)
  	if p['launch_time(4i)'].blank?
			p['launch_time(1i)'] = ''
			p['launch_time(2i)'] = ''
			p['launch_time(3i)'] = ''
		end
		return p
  end
end

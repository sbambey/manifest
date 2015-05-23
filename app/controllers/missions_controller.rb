class MissionsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

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
			redirect_to root_path
		else
			flash[:danger] = "Could not update mission."
			render 'edit'
		end
	end

	private

	def mission_params
		params.require(:mission).permit(:number, :name, :launch_time, :teaser, :body, :launched, :published, :coverage, :provider_id)
  end
end

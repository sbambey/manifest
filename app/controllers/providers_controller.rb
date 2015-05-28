class ProvidersController < ApplicationController
	before_action :authenticate_user!, except: [:show, :completed]

	def show
		@missions = Provider.friendly.find(params[:id]).missions.published.upcoming.order(number: :asc).paginate(per_page: 10, page: params[:page])
		respond_to do |format|
      format.js { render "missions.js.erb" }
      format.html
    end
	end

	def completed
		@missions = Provider.friendly.find(params[:id]).missions.published.completed.order(number: :desc).paginate(per_page: 10, page: params[:page])
		respond_to do |format|
      format.js { render "missions.js.erb" }
      format.html
    end
	end

	def new
		@provider = Provider.new
	end

	def create
		@provider = Provider.new(provider_params)
		if @provider.save
			flash[:success] = "Provider created successfully."
			redirect_to root_path
		else
			flash[:danger] = "Could not create provider."
			render 'new'
		end
	end

	def edit
		@provider = Provider.friendly.find(params[:id])
	end

	def update
		@provider = Provider.friendly.find(params[:id])
		if @provider.update_attributes(provider_params)
			flash[:success] = "Provider updated successfully."
			redirect_to root_path
		else
			flash[:danger] = "Could not update provider."
			render 'edit'
		end
	end

	private

	def provider_params
		params.require(:provider).permit(:name, :website, :logo, :banner)
  end
end

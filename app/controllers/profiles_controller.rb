class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: %i[ new edit update destroy ]
  before_action :set_profile, only: %i[ show edit update destroy ]

  # GET /profiles or /profiles.json
  def index
    if params[:artisan].blank?
      @profiles = Profile.all.order("created_at DESC")
    else
      @artisan_id = Artisan.find_by(name: params[:artisan]).id
      @profiles = Profile.where(artisan_id: @artisan_id).order("created_at DESC")
    end
  end

  # GET /profiles/1 or /profiles/1.json
  def show
    @related_profiles = @profile.artisan.profiles
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles or /profiles.json
  def create
    @profile = current_user.profiles.new(profile_params)
    if @profile.save
        redirect_to @profile, notice: "YYour profile has been successfully created."
    else
        render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
    if @profile.user == current_user
        if @profile.update(profile_params)
            redirect_to @profile, notice: "Profile record successfully updated"
        else
            render :edit, status: :unprocessable_entity
        end
    end
  end

  # DELETE /profiles/1 or /profiles/1.json
  def destroy
    if @profile.user == current_user
        @profile.destroy
        redirect_to profiles_url, notice: "Profile record successfully deleted"
    else
        redirect_to profiles_path, alert: "You are not authorized"
    end
  end

  # def email_profile
  #   first_name = params[:first_name]
  #   last_name = params[:last_name]
  #   email = params[:email]
  #   message = params[:message]
  # end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:artisan_id, :name, :about, :image, :email, :phone, :address, :min_cost, :max_cost)
    end
end

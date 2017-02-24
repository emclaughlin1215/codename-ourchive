class SeriesUsersController < ApplicationController
  before_action :set_series_user, only: [:show, :edit, :update, :destroy]

  # GET /series_users
  # GET /series_users.json
  def index
    @series_users = SeriesUser.all
  end

  # GET /series_users/1
  # GET /series_users/1.json
  def show
  end

  # GET /series_users/new
  def new
    @series_user = SeriesUser.new
  end

  # GET /series_users/1/edit
  def edit
  end

  # POST /series_users
  # POST /series_users.json
  def create
    @series_user = SeriesUser.new(series_user_params)

    respond_to do |format|
      if @series_user.save
        format.html { redirect_to @series_user, notice: 'Series user was successfully created.' }
        format.json { render :show, status: :created, location: @series_user }
      else
        format.html { render :new }
        format.json { render json: @series_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /series_users/1
  # PATCH/PUT /series_users/1.json
  def update
    respond_to do |format|
      if @series_user.update(series_user_params)
        format.html { redirect_to @series_user, notice: 'Series user was successfully updated.' }
        format.json { render :show, status: :ok, location: @series_user }
      else
        format.html { render :edit }
        format.json { render json: @series_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /series_users/1
  # DELETE /series_users/1.json
  def destroy
    @series_user.destroy
    respond_to do |format|
      format.html { redirect_to series_users_url, notice: 'Series user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_series_user
      @series_user = SeriesUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def series_user_params
      params.require(:series_user).permit(:series_id, :user_id)
    end
end

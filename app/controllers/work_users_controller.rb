class WorkUsersController < ApplicationController
  before_action :set_work_user, only: [:show, :edit, :update, :destroy]

  # GET /work_users
  # GET /work_users.json
  def index
    @work_users = WorkUser.all
  end

  # GET /work_users/1
  # GET /work_users/1.json
  def show
  end

  # GET /work_users/new
  def new
    @work_user = WorkUser.new
  end

  # GET /work_users/1/edit
  def edit
  end

  # POST /work_users
  # POST /work_users.json
  def create
    @work_user = WorkUser.new(work_user_params)

    respond_to do |format|
      if @work_user.save
        format.html { redirect_to @work_user, notice: 'Work user was successfully created.' }
        format.json { render :show, status: :created, location: @work_user }
      else
        format.html { render :new }
        format.json { render json: @work_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_users/1
  # PATCH/PUT /work_users/1.json
  def update
    respond_to do |format|
      if @work_user.update(work_user_params)
        format.html { redirect_to @work_user, notice: 'Work user was successfully updated.' }
        format.json { render :show, status: :ok, location: @work_user }
      else
        format.html { render :edit }
        format.json { render json: @work_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_users/1
  # DELETE /work_users/1.json
  def destroy
    @work_user.destroy
    respond_to do |format|
      format.html { redirect_to work_users_url, notice: 'Work user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_user
      @work_user = WorkUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_user_params
      params.require(:work_user).permit(:work_id, :user_id)
    end
end

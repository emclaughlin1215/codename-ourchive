class ModerationTypesController < ApplicationController
  before_action :set_moderation_type, only: [:show, :edit, :update, :destroy]

  # GET /moderation_types
  # GET /moderation_types.json
  def index
    @moderation_types = ModerationType.all
  end

  # GET /moderation_types/1
  # GET /moderation_types/1.json
  def show
  end

  # GET /moderation_types/new
  def new
    @moderation_type = ModerationType.new
  end

  # GET /moderation_types/1/edit
  def edit
  end

  # POST /moderation_types
  # POST /moderation_types.json
  def create
    @moderation_type = ModerationType.new(moderation_type_params)

    respond_to do |format|
      if @moderation_type.save
        format.html { redirect_to @moderation_type, notice: 'Moderation type was successfully created.' }
        format.json { render :show, status: :created, location: @moderation_type }
      else
        format.html { render :new }
        format.json { render json: @moderation_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moderation_types/1
  # PATCH/PUT /moderation_types/1.json
  def update
    respond_to do |format|
      if @moderation_type.update(moderation_type_params)
        format.html { redirect_to @moderation_type, notice: 'Moderation type was successfully updated.' }
        format.json { render :show, status: :ok, location: @moderation_type }
      else
        format.html { render :edit }
        format.json { render json: @moderation_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moderation_types/1
  # DELETE /moderation_types/1.json
  def destroy
    @moderation_type.destroy
    respond_to do |format|
      format.html { redirect_to moderation_types_url, notice: 'Moderation type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moderation_type
      @moderation_type = ModerationType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def moderation_type_params
      params.require(:moderation_type).permit(:moderation_type, :moderation_description)
    end
end

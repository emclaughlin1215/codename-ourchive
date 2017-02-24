class WorkTagsController < ApplicationController
  before_action :set_work_tag, only: [:show, :edit, :update, :destroy]

  # GET /work_tags
  # GET /work_tags.json
  def index
    @work_tags = WorkTag.all
  end

  # GET /work_tags/1
  # GET /work_tags/1.json
  def show
  end

  # GET /work_tags/new
  def new
    @work_tag = WorkTag.new
  end

  # GET /work_tags/1/edit
  def edit
  end

  # POST /work_tags
  # POST /work_tags.json
  def create
    @work_tag = WorkTag.new(work_tag_params)

    respond_to do |format|
      if @work_tag.save
        format.html { redirect_to @work_tag, notice: 'Work tag was successfully created.' }
        format.json { render :show, status: :created, location: @work_tag }
      else
        format.html { render :new }
        format.json { render json: @work_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_tags/1
  # PATCH/PUT /work_tags/1.json
  def update
    respond_to do |format|
      if @work_tag.update(work_tag_params)
        format.html { redirect_to @work_tag, notice: 'Work tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @work_tag }
      else
        format.html { render :edit }
        format.json { render json: @work_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_tags/1
  # DELETE /work_tags/1.json
  def destroy
    @work_tag.destroy
    respond_to do |format|
      format.html { redirect_to work_tags_url, notice: 'Work tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_tag
      @work_tag = WorkTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_tag_params
      params.require(:work_tag).permit(:tag_id, :work_id)
    end
end

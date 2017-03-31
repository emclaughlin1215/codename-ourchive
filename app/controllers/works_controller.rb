class WorksController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update, :destroy]
  before_action :set_work_form, only: [:edit]
  before_action :create_tags_lists, only: [:edit, :update]
  # GET /works
  # GET /works.json
  def index
    @works = Work.where(user_id: current_user.id)
  end

  # GET /works/1
  # GET /works/1.json
  def show
  end

  # GET /works/new
  def new
    if current_user
      @work_types = WorkType.all
      @work_creation_form = WorkCreationForm.new
    else
      redirect_to new_user_session_path, notice: 'You are not currently logged in.'
    end
  end

  # GET /works/1/edit
  def edit
    @work = Work.find(params[:id])
    @chapters = @work.chapters
    if (@chapters.count < 2)
      @work_creation_form.set_user!(current_user)
    end
  end

  # POST /works
  # POST /works.json
  def create
    work_id = params[:work_creation_form][:work_id].to_s
    if (work_id == "")
      @work_creation_form = WorkCreationForm.new(params[:work_creation_form])
      @work_creation_form.set_user!(current_user)
      respond_to do |format|
        if @work_creation_form.save
          format.html { redirect_to works_path, notice: 'Work was successfully created.' }
          format.json { render :show, status: :created, location: @work }
        else
          format.html { render :new }
          format.json { render json: @work_creation_form.errors, status: :unprocessable_entity }
        end
      end
    else
      @work_creation_form = WorkCreationForm.new(params[:work_creation_form])
      @work_creation_form.update()
      redirect_to works_path, notice: 'Work was successfully updated.'
    end
  end
  # PATCH/PUT /works/1
  # PATCH/PUT /works/1.json
  def update
    respond_to do |format|
      if @work.update(work_params)
        format.html { redirect_to @work, notice: 'Work was successfully updated.' }
        format.json { render :show, status: :ok, location: @work }
      else
        format.html { render :edit }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /works/1
  # DELETE /works/1.json
  def destroy
    @work.destroy
    respond_to do |format|
      format.html { redirect_to works_url, notice: 'Work was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work
      @work = Work.find(params[:id])
    end
    def set_work_form
      @work_creation_form = WorkCreationForm.new(work_summary: @work.work_summary, work_title: @work.title, is_series: @work.is_series, work_type: @work.work_type, is_complete: @work.is_complete,
        work_id: @work.id)
    end
    def create_tags_lists
      @zero_tags_list = @work.tags.where(type_key: 0)
      @one_tags_list = @work.tags.where(type_key: 1)
      @two_tags_list = @work.tags.where(type_key: 2)
      @three_tags_list = @work.tags.where(type_key: 3)
      @four_tags_list = @work.tags.where(type_key: 4)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def work_params
      params.require(:work).permit(:work_summary, :is_series, :is_complete, :series_id, :collection_id, :word_count, :total_chapters)
    end

    def work_creation_form_params
      params.require(:work_creation_form).permit(:work_summary, :is_complete, :series_id, :collection_id, :word_count, :total_chapters, :is_series, :body_text, :character_tags, :theme_tags, :fandom_tags, :primary_pairing_tags, :secondary_pairing_tags)
    end
end

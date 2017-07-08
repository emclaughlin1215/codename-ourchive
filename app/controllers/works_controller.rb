class WorksController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update, :destroy]
  before_action :set_work_form, only: [:edit]
  before_action :create_tags_lists, only: [:edit, :update]
  # GET /works
  # GET /works.json
  def index
    if current_user
      @works = Work.where(user_id: current_user.id)
    else
      redirect_to new_user_session_path, notice: 'You are not currently logged in.'
    end
  end
  def new_chapter_on_work
    respond_to do |format|
      format.js {render layout: false} # Add this line to you respond_to block
    end
  end
  def reorder_work_chapters
    respond_to do |format|
      format.html
      format.js
    end
  end
  def delete_chapter_image
    chapter = Chapter.find(params[:chapter_id])
    chapter.body_image.destroy
    chapter.body_image.clear
    chapter.save
    redirect_to edit_work_path
  end
  def delete_chapter_audio
    chapter = Chapter.find(params[:chapter_id])
    chapter.body_audio.destroy
    chapter.body_audio.clear
    chapter.save
    redirect_to edit_work_path
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
    @work = Work.includes(:tags).find(params[:id])
    @chapters = @work.chapters.order('chapter_number ASC')
    @work_creation_form.set_user!(current_user)
    @is_edit = true
  end

  # POST /works
  # POST /works.json
  def create
    permitted_params = work_creation_form_params.to_h
    work_id = permitted_params[:work_id].to_s
    if (work_id == "")
      @work_creation_form = WorkCreationForm.new(permitted_params)
      @work_creation_form.set_user!(current_user)
      @work_creation_form.set_chapters(params[:chapters], params[:titles])
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
      @work_creation_form = WorkCreationForm.new(permitted_params)
      @work_creation_form.set_chapters(params[:chapters], params[:titles])
      @work_creation_form.set_edit_chapters(params[:summaries], params[:body_numbers], params[:body_texts],
        params[:body_audios], params[:body_images], params[:body_images_stub], params[:body_audios_stub])
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
      @work = Work.includes(:tags).find(params[:id])
    end
    def set_work_form
      @work_creation_form = WorkCreationForm.new(work_summary: @work.work_summary, work_title: @work.title, is_series: @work.is_series, work_type: @work.work_type, is_complete: @work.is_complete,
        work_id: @work.id)
    end
    def create_tags_lists
      @tags_list = @work.tags
      @zero_tags_list = @tags_list.select {|tag| 0 == tag.type_key}
      @one_tags_list = @tags_list.select {|tag| 1 == tag.type_key }
      @two_tags_list = @tags_list.select {|tag| 2 == tag.type_key }
      @three_tags_list = @tags_list.select {|tag| 3 == tag.type_key }
      @four_tags_list = @tags_list.select {|tag| 4 == tag.type_key}
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def work_params
      params.require(:work).permit(:work_summary, :is_series, :is_complete, :series_id, :collection_id, :word_count, :total_chapters)
    end

    def work_creation_form_params
      params.require(:work_creation_form).permit(:work_summary, :work_title, :is_complete, :series_id, :collection_id, :word_count, :total_chapters, :is_series, :body_text, :character_tags, :theme_tags, :fandom_tags, :primary_pairing_tags, :secondary_pairing_tags, :one_tags, :work_type, :work_id, :tags_to_remove,
        :body_image)
    end
end

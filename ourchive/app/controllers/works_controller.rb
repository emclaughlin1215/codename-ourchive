class WorksController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update, :destroy]

  # GET /works
  # GET /works.json
  def index
    @works = Work.all
  end

  # GET /works/1
  # GET /works/1.json
  def show
  end

  # GET /works/new
  def new
    if current_user
      @work = Work.new
      @chapter = Chapter.new
      @tags = []
      @character_tag = Tag.new(:is_character => true)
      @tags << Tag.new(:is_fandom => true)
      @tags << Tag.new(:is_theme => true)
    else
      redirect_to new_user_session_path, notice: 'You are not currently logged in.'
    end
  end

  # GET /works/1/edit
  def edit
  end

  # POST /works
  # POST /works.json
  def create
    @work = Work.new(work_params)
    @chapter = Chapter.new
    @chapter.body_text = params[:chapter][:body_text]
    @work.user = current_user
    respond_to do |format|
      if @work.save
        @chapter.work_id = @work.id
        @chapter.chapter_number = 1
        @chapter.chapter_summary = @work.work_summary
        if @chapter.save
          format.html { redirect_to @work, notice: 'Work was successfully created.' }
          format.json { render :show, status: :created, location: @work }
        else
          format.html { render :new }
          format.json { render json: @work.errors, status: :unprocessable_entity}
        end
      else
        format.html { render :new }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_params
      params.require(:work).permit(:work_summary, :is_series, :is_complete, :series_id, :collection_id, :word_count, :total_chapters)
    end
end

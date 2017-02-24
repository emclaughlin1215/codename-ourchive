class BookmarkBookmarkTagsController < ApplicationController
  before_action :set_bookmark_bookmark_tag, only: [:show, :edit, :update, :destroy]

  # GET /bookmark_bookmark_tags
  # GET /bookmark_bookmark_tags.json
  def index
    @bookmark_bookmark_tags = BookmarkBookmarkTag.all
  end

  # GET /bookmark_bookmark_tags/1
  # GET /bookmark_bookmark_tags/1.json
  def show
  end

  # GET /bookmark_bookmark_tags/new
  def new
    @bookmark_bookmark_tag = BookmarkBookmarkTag.new
  end

  # GET /bookmark_bookmark_tags/1/edit
  def edit
  end

  # POST /bookmark_bookmark_tags
  # POST /bookmark_bookmark_tags.json
  def create
    @bookmark_bookmark_tag = BookmarkBookmarkTag.new(bookmark_bookmark_tag_params)

    respond_to do |format|
      if @bookmark_bookmark_tag.save
        format.html { redirect_to @bookmark_bookmark_tag, notice: 'Bookmark bookmark tag was successfully created.' }
        format.json { render :show, status: :created, location: @bookmark_bookmark_tag }
      else
        format.html { render :new }
        format.json { render json: @bookmark_bookmark_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookmark_bookmark_tags/1
  # PATCH/PUT /bookmark_bookmark_tags/1.json
  def update
    respond_to do |format|
      if @bookmark_bookmark_tag.update(bookmark_bookmark_tag_params)
        format.html { redirect_to @bookmark_bookmark_tag, notice: 'Bookmark bookmark tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @bookmark_bookmark_tag }
      else
        format.html { render :edit }
        format.json { render json: @bookmark_bookmark_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmark_bookmark_tags/1
  # DELETE /bookmark_bookmark_tags/1.json
  def destroy
    @bookmark_bookmark_tag.destroy
    respond_to do |format|
      format.html { redirect_to bookmark_bookmark_tags_url, notice: 'Bookmark bookmark tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark_bookmark_tag
      @bookmark_bookmark_tag = BookmarkBookmarkTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookmark_bookmark_tag_params
      params.require(:bookmark_bookmark_tag).permit(:bookmark_id, :user_id)
    end
end

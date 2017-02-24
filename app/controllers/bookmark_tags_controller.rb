class BookmarkTagsController < ApplicationController
  before_action :set_bookmark_tag, only: [:show, :edit, :update, :destroy]

  # GET /bookmark_tags
  # GET /bookmark_tags.json
  def index
    @bookmark_tags = BookmarkTag.all
  end

  # GET /bookmark_tags/1
  # GET /bookmark_tags/1.json
  def show
  end

  # GET /bookmark_tags/new
  def new
    @bookmark_tag = BookmarkTag.new
  end

  # GET /bookmark_tags/1/edit
  def edit
  end

  # POST /bookmark_tags
  # POST /bookmark_tags.json
  def create
    @bookmark_tag = BookmarkTag.new(bookmark_tag_params)

    respond_to do |format|
      if @bookmark_tag.save
        format.html { redirect_to @bookmark_tag, notice: 'Bookmark tag was successfully created.' }
        format.json { render :show, status: :created, location: @bookmark_tag }
      else
        format.html { render :new }
        format.json { render json: @bookmark_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookmark_tags/1
  # PATCH/PUT /bookmark_tags/1.json
  def update
    respond_to do |format|
      if @bookmark_tag.update(bookmark_tag_params)
        format.html { redirect_to @bookmark_tag, notice: 'Bookmark tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @bookmark_tag }
      else
        format.html { render :edit }
        format.json { render json: @bookmark_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmark_tags/1
  # DELETE /bookmark_tags/1.json
  def destroy
    @bookmark_tag.destroy
    respond_to do |format|
      format.html { redirect_to bookmark_tags_url, notice: 'Bookmark tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark_tag
      @bookmark_tag = BookmarkTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookmark_tag_params
      params.require(:bookmark_tag).permit(:user_id, :text)
    end
end

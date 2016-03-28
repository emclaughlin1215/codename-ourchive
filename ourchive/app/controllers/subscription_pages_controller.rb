class SubscriptionPagesController < ApplicationController
  before_action :set_subscription_page, only: [:show, :edit, :update, :destroy]

  # GET /subscription_pages
  # GET /subscription_pages.json
  def index
    @subscription_pages = SubscriptionPage.all
  end

  # GET /subscription_pages/1
  # GET /subscription_pages/1.json
  def show
  end

  # GET /subscription_pages/new
  def new
    @subscription_page = SubscriptionPage.new
  end

  # GET /subscription_pages/1/edit
  def edit
  end

  # POST /subscription_pages
  # POST /subscription_pages.json
  def create
    @subscription_page = SubscriptionPage.new(subscription_page_params)

    respond_to do |format|
      if @subscription_page.save
        format.html { redirect_to @subscription_page, notice: 'Subscription page was successfully created.' }
        format.json { render :show, status: :created, location: @subscription_page }
      else
        format.html { render :new }
        format.json { render json: @subscription_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscription_pages/1
  # PATCH/PUT /subscription_pages/1.json
  def update
    respond_to do |format|
      if @subscription_page.update(subscription_page_params)
        format.html { redirect_to @subscription_page, notice: 'Subscription page was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscription_page }
      else
        format.html { render :edit }
        format.json { render json: @subscription_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscription_pages/1
  # DELETE /subscription_pages/1.json
  def destroy
    @subscription_page.destroy
    respond_to do |format|
      format.html { redirect_to subscription_pages_url, notice: 'Subscription page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription_page
      @subscription_page = SubscriptionPage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_page_params
      params.require(:subscription_page).permit(:user_id, :work_id, :finished)
    end
end

class TagSuggestionsController < ApplicationController
  def index
    render json: TagSuggestion.terms_for(params[:term], params[:type])
  end
end

class TagSuggestionsController < ApplicationController
  def index
    puts TagSuggestion.terms_for(params[:term], params[:type])
    puts params[:term]
    puts params[:type]
    render json: TagSuggestion.terms_for(params[:term], params[:type])
  end
end

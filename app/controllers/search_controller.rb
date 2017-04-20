class SearchController < ApplicationController

def show
  @results = Work.search(params[:search_term])
  @title = @results.results.first._source.title
end

private

  def search_params
    params.require(:search).permit(:search_term)
  end
end

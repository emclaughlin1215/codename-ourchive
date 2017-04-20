class SearchController < ApplicationController

def show
  @results = Work.search(params[:search_term], fields: [{title: :word_start}, {work_summary: :word_start}])
end

private

  def search_params
    params.require(:search).permit(:search_term)
  end
end

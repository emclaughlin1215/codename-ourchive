class SearchController < ApplicationController

def index
  @work_types = WorkType.all.collect {|t| [ t.type_name, t.type_key ] }
  @work_types += ["All"]
end

def show
  @results = Work.search(params[:search_term], where: {work_type: params[:work_type]}, fields: [{title: :word_start}, {work_summary: :word_start}])
  @tags = Tag.search(params[:search_term], fields: [{text: :word_start}])
  puts @tags
end

private

  def search_params
    params.require(:search).permit(:search_term, :work_type, :tag_type)
  end
end

class SearchController < ApplicationController

def index
  @work_types = WorkType.all.collect {|t| [ t.type_name, t.type_key ] }
  @work_types += ["All"]
end

def show
  @works = Work.search(params[:search_term], where: {work_type: params[:work_type]}, fields: [{title: :word_start}, {work_summary: :word_start}])
  @tags = Tag.search(params[:search_term], fields: [{text: :word_start}])
  @tag_works = Work.includes(:tags).where('tags.id in (?) or works.id in (?)', @tags.results, @works.results).references(:tags)

end

private

  def search_params
    params.require(:search).permit(:search_term, :work_type, :tag_type)
  end
end

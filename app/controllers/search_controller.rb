class SearchController < ApplicationController

def index
  @work_types = WorkType.all.collect {|t| [ t.type_name, t.type_key ] }
  @work_types += ["All"]
end

def show
  if (params[:work_type] == 'All')
    @init_works = Work.search(params[:search_term], fields: [{title: :word_start}, {work_summary: :word_start}])
  else
    @init_works = Work.search(params[:search_term], where: {work_type: params[:work_type]}, fields: [{title: :word_start}, {work_summary: :word_start}])
  end
  if (params[:tag_type] == 'All')
    @tags = Tag.search(params[:search_term], fields: [{text: :word_start}])
  else
    @tags = Tag.search(params[:search_term], where: {type_key: params[:tag_type]}, fields: [{text: :word_start}])
  end
  @results = Work.joins(:tags).where('works.id in (?) or tags.id in (?)', @init_works.results, @tags.results).references(:tags).distinct.paginate(:page => params[:page], :per_page => 25)
end

private

  def search_params
    params.require(:search).permit(:search_term, :work_type, :tag_type)
  end
end

class SearchController < ApplicationController

def index
  @work_types = WorkType.all.collect {|t| [ t.type_name, t.type_key ] }
  @work_types += ["All"]
end

def show
  # @results = Searchkick.search(params[:search_term], index_name: [Work, Tag], where: {work_type: params[:work_type]}, fields: [{title: :word_start}, {work_summary: :word_start}, {text: :word_start}])
  @works = Work.search(params[:search_term], where: {work_type: params[:work_type]}, fields: [{title: :word_start}, {work_summary: :word_start}])
  @tags = Tag.search(params[:search_term], fields: [{text: :word_start}])
  ids = ""
  counter = 0
  @tags.each do |t|
    if (counter > 0)
      ids += ","
    end
    ids += t.id.to_s
  end
  @tag_works = Work.joins("LEFT JOIN work_tags on work_tags.work_id = works.id LEFT JOIN tags on tags.id = work_tags.id WHERE tags.id in ("+ ids+")")
end

private

  def search_params
    params.require(:search).permit(:search_term, :work_type, :tag_type)
  end
end

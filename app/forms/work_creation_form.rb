class WorkCreationForm
    include ActiveModel::Model
    include Virtus.model
    attribute :user_id, Integer
    attribute :work_summary, String
    attribute :is_complete, Boolean
    attribute :series_id, Integer
    attribute :collection_id, Integer
    attribute :word_count, Integer
    attribute :total_chapters, Integer
    attribute :is_series, Boolean
    attribute :body_text, String
    attribute :one_tags, String
    attribute :work_title, String
    attribute :work_type, Integer    
    attribute :work_id, Integer
    attribute :tags_to_remove, String
    attribute :body_external, String
 
    validates :work_summary, presence: true
    validates :work_title, presence: true
    attr_reader :work

    def save
        if valid?
            persist!
            true
        else
            false
        end
    end
    def set_chapters(chapters_param, titles_param)
      @chapters = chapters_param
      @chapter_titles = titles_param
    end
    def create_for_edit!(work)
      work_id = work.id
      work_summary = work.work_summary
      is_complete = work.is_complete
      is_series = work.is_series
      work_title = work.title
      work_type = work_type
    end
    def set_user!(user)
        self.user_id = user.id
    end
    def update()
      Work.update(work_id, :work_summary => work_summary, :title => work_title, :is_complete => is_complete,
        :word_count => word_count, :total_chapters => total_chapters)
      @work = Work.find(work_id)
      update_tags()
    end
    private

    def persist!
        @work = Work.create!(work_summary: work_summary, is_complete: is_complete, series_id: series_id,
            word_count: body_text.split.size, total_chapters: total_chapters, is_series: is_series, user_id: user_id, title: work_title, work_type: work_type)
        if (work_type == 1)
          chapter = @work.chapters.create!(body_text: body_text, chapter_summary: work_summary, chapter_number: 1, title: work_title)
        elsif (work_type == 2)
          chapter = @work.chapters.create!(body_image: body_external, chapter_summary: work_summary, chapter_number: 1, title: work_title)
        elsif(work_type == 0)
          chapter = @work.chapters.create!(body_audio: body_external, chapter_summary: work_summary, chapter_number: 1, title: work_title)
        end
        counter = 1
        if (@chapters)
          @chapters.each do |chapter|
            create_chapter(chapter, counter)
            counter = counter + 1
          end
        end
        one_tags_split = one_tags.to_s.split(",")
        one_tags_split.each do |tag|
	    split = tag.split("~")
            @tag = Tag.where(text: split[0], type_key: split[1]).first_or_create
            WorkTag.where(tag_id: @tag.id, work_id: @work.id).first_or_create
            TagSuggestion.add_tag(@tag)
        end
    end
    def create_chapter(chapter, counter)
      if (work_type == 1)
          @work.chapters.create!(body_text: chapter, chapter_summary: work_summary, chapter_number: counter+1, title: @chapter_titles[counter - 1])
        elsif (work_type == 2)
          @work.chapters.create!(body_image: chapter, chapter_summary: work_summary, chapter_number: counter+1, title: @chapter_titles[counter - 1])
        elsif(work_type == 0)
          @work.chapters.create!(body_audio: chapter, chapter_summary: work_summary, chapter_number: counter+1, title: @chapter_titles[counter - 1])
        end
    end
    def update_tags
      tags_to_remove_split = tags_to_remove.to_s.split(",")
      tags_to_remove_split.each do |tag|
        @work.tags.delete(tag)
      end
      three_tags_split = three_tags.to_s.split(",")
      three_tags_split.each do |tag|
          @tag = Tag.where(text: tag, type_key: 3).first_or_create
          WorkTag.create!(tag_id: @tag.id, work_id: @work.id)
          TagSuggestion.add_tag(@tag)
      end
      zero_tags_split = zero_tags.to_s.split(",")
      zero_tags_split.each do |tag|
          @tag = Tag.where(text: tag, type_key: 0).first_or_create
          WorkTag.create!(tag_id: @tag.id, work_id: @work.id)
          TagSuggestion.add_tag(@tag)
      end
      one_tags_split = one_tags.to_s.split(",")
        one_tags_split.each do |tag|
            @tag = Tag.where(text: tag, type_key: 1).first_or_create
            WorkTag.where(tag_id: @tag.id, work_id: @work.id).first_or_create
            TagSuggestion.add_tag(@tag)
        end
        four_tags_split = four_tags.to_s.split(",")
        four_tags_split.each do |tag|
            @tag = Tag.where(text: tag, type_key: 4).first_or_create
            WorkTag.create!(tag_id: @tag.id, work_id: @work.id)
            TagSuggestion.add_tag(@tag)
        end
        two_tags_split = two_tags.to_s.split(",")
        two_tags_split.each do |tag|
            @tag = Tag.where(text: tag, type_key: 2).first_or_create
            WorkTag.create!(tag_id: @tag.id, work_id: @work.id)
            TagSuggestion.add_tag(@tag)
        end
    end
    def update_work
      puts current_work
    end
end

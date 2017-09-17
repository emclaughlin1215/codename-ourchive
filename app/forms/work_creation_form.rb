class WorkCreationForm
    include ActiveModel::Model
    include Virtus.model
    include ActionDispatch::Http
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
    attribute :body_audio_hidden, Hash
    attribute :chapter_audios, String
    #attribute :body_external, String
    #attribute :body_audio, File
    attribute :body_image, UploadedFile
    validates :work_summary, presence: true
    validates :work_title, presence: true
    attr_reader :work

    def save
        if valid?
            return_val = persist!
            return_val
        else
            false
        end
    end
    def set_chapters(chapters_param, titles_param)
      @chapters = chapters_param
      @chapter_titles = titles_param
    end
    def set_audio_chapters(audios_param, titles_param)
      @chapter_titles = titles_param
      audios = audios_param.to_s.split("\r\n")
      @chapters = []
      audios.each do |audio|
        @chapters << audio
      end
    end
    def set_edit_chapters(summaries_param, body_numbers_param, body_texts_param, body_audios_param, body_images_param,
    body_images_stub_param, body_audios_stub_param )
      @summaries = summaries_param
      @body_texts = body_texts_param
      @body_images = body_images_param ? body_images_param : []
      @body_audios = body_audios_param ? body_audios_param : []
      @body_numbers = body_numbers_param ? body_numbers_param : []
      @images_stub = body_images_stub_param
      @audios_stub = body_audios_stub_param
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
      @work = Work.find(work_id)
      update_tags()
      word_count = update_chapters()
      Work.update(work_id, :work_summary => work_summary, :title => work_title, :is_complete => is_complete, :word_count => word_count,
        :total_chapters => total_chapters)
    end
    private

    def persist!
        if (work_id && work_id != "")
          update()
        else
          word_count = text_wordcount(body_text)
          @work = Work.create!(work_summary: work_summary, is_complete: is_complete, series_id: series_id,
            word_count: text_wordcount(body_text), total_chapters: total_chapters, is_series: is_series, user_id: user_id, title: work_title, work_type: work_type)
          if (work_type == 1)
            begin
              chapter = @work.chapters.create!(body_text: body_text, chapter_summary: work_summary, chapter_number: 1, title: work_title)
            rescue 
              add_type_error
              @work.destroy
              return false
            end
          elsif (work_type == 2)
            begin
              chapter = @work.chapters.create!(body_image: body_image, chapter_summary: work_summary, chapter_number: 1, title: work_title)
            rescue 
              add_type_error
              @work.destroy
              return false
            end
          elsif(work_type == 0)
            begin
              chapter =  @work.chapters.create!(chapter_audio: body_audio_hidden, chapter_summary: work_summary, chapter_number: 1, title: work_title)
            rescue               
              add_type_error
              @work.destroy
              return false
            end
          end
          counter = 1
          if (@chapters)
            @chapters.each do |chapter|
              create_chapter(chapter, counter, counter)
              counter = counter + 1
              word_count += text_wordcount(body_text)
            end
          end
          one_tags_split = one_tags.to_s.split(",")
          one_tags_split.each do |tag|
	          split = tag.split("~")
            @tag = Tag.where(text: split[0], type_key: split[1]).first_or_create
            WorkTag.where(tag_id: @tag.id, work_id: @work.id).first_or_create
            TagSuggestion.add_tag(@tag)
          end
          Work.update(@work.id, word_count: word_count)
        end
    end
    def create_chapter(chapter, counter, counter_title)
      if (work_type == 1)
          @work.chapters.create!(body_text: chapter, chapter_summary: work_summary, chapter_number: counter+1, title: @chapter_titles[counter_title - 1])
        elsif (work_type == 2)
          @work.chapters.create!(body_image: chapter, chapter_summary: work_summary, chapter_number: counter+1, title: @chapter_titles[counter_title - 1])
        elsif(work_type == 0)
          @work.chapters.create!(chapter_audio: chapter, chapter_summary: work_summary, chapter_number: counter+1, title: @chapter_titles[counter_title - 1])
        end
    end
    def update_tags
      tags_to_remove_split = tags_to_remove.to_s.split(",")
      tags_to_remove_split.each do |tag|
        @work.tags.delete(tag)
      end
      one_tags_split = one_tags.to_s.split(",")
      one_tags_split.each do |tag|
        split = tag.split("~")
        @tag = Tag.where(text: split[0], type_key: split[1]).first_or_create
        WorkTag.where(tag_id: @tag.id, work_id: @work.id).first_or_create
        TagSuggestion.add_tag(@tag)
      end
    end
    def update_chapters
      counter = 0
      audio_counter = 0
      image_counter = 0
      word_count = 0
      @work.chapters.order('chapter_number ASC').each do |chapter|
        chapter.body_text = @body_texts[counter] && @body_texts[counter] != "" ? @body_texts[counter] : chapter.body_text
        if (@images_stub[counter] != "")
          chapter.body_image = @body_images[image_counter]
          image_counter = image_counter + 1
        end
        if (@audios_stub[counter] != "")
          chapter.body_audio = @body_audios[audio_counter]
          audio_counter = audio_counter + 1
        end
        chapter.chapter_summary = @summaries[counter]
        chapter.chapter_number = @body_numbers[counter]
        chapter.save
        counter = counter + 1
        if (chapter.body_text)
          word_count = word_count + text_wordcount(chapter.body_text)
        end
      end
      if (@chapters)
        counter_title = 1
        @chapters.each do |chapter|
          word_count = word_count + text_wordcount(chapter)
          create_chapter(chapter, counter, counter_title)
          counter_title = counter_title + 1
          counter = counter + 1
        end
      end
      return word_count
    end
    def update_work
      puts current_work
    end
    def add_type_error
      self.errors[:base] << "Type invalid. Please choose a different file."
    end
    def text_wordcount(original)
      return original.split.size
    end
end

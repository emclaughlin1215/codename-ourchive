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
    attribute :four_tags, String
    attribute :zero_tags, String
    attribute :two_tags, String
    attribute :three_tags, String
    attribute :work_title, String
    
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

    def set_user!(user)
        self.user_id = user.id
    end

    private

    def persist!
        @work = Work.create!(work_summary: work_summary, is_complete: is_complete, series_id: series_id, collection_id: collection_id,
            word_count: word_count, total_chapters: total_chapters, is_series: is_series, user_id: user_id, title: work_title)
        chapter = @work.chapters.create!(body_text: body_text, chapter_summary: work_summary, chapter_number: 1)
        one_tags_split = one_tags.to_s.split(",")
        one_tags_split.each do |tag|
            @tag = Tag.where(text: tag, type_key: 1).first_or_create
            WorkTag.create!(tag_id: @tag.id, work_id: @work.id)
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
    end
end

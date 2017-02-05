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
    attribute :character_tags, String
    attribute :theme_tags, String
    attribute :fandom_tags, String
    attribute :primary_pairing_tags, String
    attribute :secondary_pairing_tags, String

    validates :work_summary, presence: true

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
            word_count: word_count, total_chapters: total_chapters, is_series: is_series, user_id: user_id)
        chapter = @work.chapters.create!(body_text: body_text, chapter_summary: work_summary, chapter_number: 1)
        character_tags_split = character_tags.to_s.split("\r\n")
        character_tags_split.each do |tag|
            @tag = Tag.where(text: tag, is_character: true).first_or_create
            WorkTag.create!(tag_id: @tag.id, work_id: @work.id)
        end
        theme_tags_split = theme_tags.to_s.split("\r\n")
        theme_tags_split.each do |tag|
            @tag = Tag.where(text: tag, is_theme: true).first_or_create
            WorkTag.create!(tag_id: @tag.id, work_id: @work.id)
        end
        primary_pairing_tags_split = primary_pairing_tags.to_s.split("\r\n")
        primary_pairing_tags_split.each do |tag|
            @tag = Tag.where(text: tag, is_primary_pairing: true).first_or_create
            WorkTag.create!(tag_id: @tag.id, work_id: @work.id)
        end
        secondary_pairing_tags_split = secondary_pairing_tags.to_s.split("\r\n")
        secondary_pairing_tags_split.each do |tag|
            @tag = Tag.where(text: tag, is_secondary_pairing: true).first_or_create
            WorkTag.create!(tag_id: @tag.id, work_id: @work.id)
        end
        fandom_tags_split = fandom_tags.to_s.split("\r\n")
        fandom_tags_split.each do |tag|
            @tag = Tag.where(text: tag, is_fandom: true).first_or_create
            WorkTag.create!(tag_id: @tag.id, work_id: @work.id)
        end
    end
end

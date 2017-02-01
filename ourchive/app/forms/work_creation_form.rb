class WorkCreationForm
    include ActiveModel::Model
    include Virtus

    attribute :work_summary, String
    attribute :is_complete, Boolean
    attribute :series_id, Integer
    attribute :collection_id, Integer
    attribute :word_count, Integer
    attribute :total_chapters, Integer
    attribute :is_series, Boolean
    attribute :body_text, String
    attribute :character_tags, Array[String]
    attribute :theme_tags, Array[String]
    attribute :fandom_tags, Array[String]
    attribute :primary_pairing_tags, Array[String]
    attribute :secondary_pairing_tags, Array[String]

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

    private

    def persist!
        @work = Work.create!(work_summary: work_summary, is_complete: is_complete, series_id: series_id, collection_id: collection_id,
            word_count: word_count, total_chapters: total_chapters, is_series: is_series)
        chapter = @work.chapters.create!(body_text: body_text, chapter_summary: work_summary, chapter_number: 1)
        character_tags.each do |tag|
            @tag = Tag.where(tag_text: tag).first_or_create
            WorkTag.create!(tag_id: @tag.id, work_id: @work.id)
        end
    end
end

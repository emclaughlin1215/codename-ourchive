class WorkCreationForm
    include ActiveModel::Model
    include Virtus

    attribute :tag_text, String
    attribute :tag_type, Integer

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
        @work = Work.create!
        chapter = @work.chapters.create!

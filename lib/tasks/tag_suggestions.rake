namespace :tag_suggestions do

  desc 'Generate search suggestions'
  task index: :environment do
    TagSuggestion.seed
  end

end

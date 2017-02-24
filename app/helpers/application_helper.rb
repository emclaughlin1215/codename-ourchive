module ApplicationHelper
  def full_title(page_title)
    full_title = "Codename: Ourchive"
    page_title.present? ? (full_title += " | #{page_title}") : full_title
  end
end
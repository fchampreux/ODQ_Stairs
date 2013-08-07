module ApplicationHelper

  #Provide full title of a page
  def full_title(page_title)
    base_title = "Open Data Quality Stairs"
    if page_title.empty?
      base_title
    else
      "#{base_title} - #{page_title}"
    end
  end

end

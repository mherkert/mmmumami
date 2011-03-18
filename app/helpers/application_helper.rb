module ApplicationHelper
  
  def logo
     image_tag("logo.png", :alt => "MmmUmami", :class => "round")
  end
  
  # Return a title on a per-page basis.
  def title
    base_title = "MmmUmami" 
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end

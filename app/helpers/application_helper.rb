# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def display_flash(*flashes)
    flashes = [:notice] if flashes.empty?
    flashes.map! do |type|
      if flash[type]
        content_tag(:div, :id => "flash-#{type}", :class => "flash #{type}") do
          link_to_function("X") { |page| page["flash-#{type}"].visual_effect :fade } + flash[type]
        end
      end
    end
    flashes.join
  end
  
  def image_for_content_type(content_type)
    case content_type
    when 'application/msword'
      image_tag 'word.png'
    when 'application/pdf'
      image_tag 'pdf.png'
    else
      image_tag 'attachment.png'
    end
  end
end

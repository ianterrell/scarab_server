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
  
  def iphone_display(copy)
    content_tag :div, :class => "iphone-display" do
      (copy || "").gsub("\n", content_tag(:br)).gsub("   ","&nbsp;&nbsp;&nbsp;").gsub("scarab://footnotes/", "#footnote_").gsub("scarab://", "/")
    end
  end
  
  def publication_time(time)
    if time.nil?
      "Not set for publication"
    elsif time > Time.now
      "Will be published at #{time.to_s(:short)}"
    else
      "Published at #{time.to_s(:short)}"
    end
  end
  
  def issues_options(options={})
    Issue.all.collect {|p| [ p.title, p.id ] }
  end
  
  def authors_options(options={})
    Author.all.collect {|p| [ p.name, p.id ] }
  end
  
  def submissions_options(options={})
    Submission.accepted.collect {|p| [ "#{p.title} - #{p.user.name}", p.id ] }
  end
  
  def users_options(options={})
    User.all.collect {|p| [ p.name, p.id ] }
  end
end

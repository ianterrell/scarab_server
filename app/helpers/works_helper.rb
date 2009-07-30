module WorksHelper
  def issues_options(options={})
    Issue.all.collect {|p| [ p.title, p.id ] }
  end  
  
  def authors_options(options={})
    Author.all.collect {|p| [ p.name, p.id ] }
  end
  
  def submissions_options(options={})
    Submission.accepted.collect {|p| [ "#{p.title} - #{p.user.name}", p.id ] }
  end
end

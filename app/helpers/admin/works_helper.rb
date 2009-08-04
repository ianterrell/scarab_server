module Admin::WorksHelper
  def submissions_options(options={})
    Submission.accepted.collect {|p| [ "#{p.title} - #{p.user.name}", p.id ] }
  end
  
  def a_type(work)
    case work.work_type
    when "Poem"
      "A poem"
    when "Fiction"
      "Fiction"
    when "Essay"
      "An essay"
    end
  end
end

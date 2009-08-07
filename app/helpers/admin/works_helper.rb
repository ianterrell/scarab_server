module Admin::WorksHelper
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

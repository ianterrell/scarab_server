module Admin::AuthorsHelper
  def users_options(options={})
    User.all.collect {|p| [ p.name, p.id ] }
  end
end

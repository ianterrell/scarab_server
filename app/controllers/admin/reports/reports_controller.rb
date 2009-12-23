class Admin::Reports::ReportsController < Admin::AdminController
  layout 'admin_money'
  
  def object_url
    [:admin, :reports, object]
  end

  def collection_url
    [:admin, :reports, collection]
  end
end



module PagesHelper
  def render_region(region)
    render "pages/#{controller.action_name}_region", :region => region
  end
end
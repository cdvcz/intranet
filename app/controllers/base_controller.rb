class BaseController < InheritedResources::Base
  load_and_authorize_resource

  respond_to :json

  def index
    params[:search] ||= {}
    params[:search][:meta_sort] ||= 'id.asc'

    @search = resource_class.search(params[:search])
    @resources = @search.paginate(page: params[:page])
  end
end

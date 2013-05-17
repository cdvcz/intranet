class BaseController < InheritedResources::Base
  load_and_authorize_resource

  respond_to :json

  def index
    params[:search] ||= {}
    params[:search][:meta_sort] ||= 'id.asc'

    query = resource_class
    resource_class.reflect_on_all_associations(:belongs_to).each do |association|
      query = query.joins(association.name).includes(association.name)
    end

    @search = query.search(params[:search])
    @resources = @search.paginate(page: params[:page])
  end
end

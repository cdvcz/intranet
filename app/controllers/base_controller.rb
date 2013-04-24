class BaseController < InheritedResources::Base
  respond_to :json

  # def create
  #   @resource = resource_class.new(resource_params.first)
  #   if @resource.save
  #     render status: 201
  #   else
  #     render status: 422
  #   end
  # end

end

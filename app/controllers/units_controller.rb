class UnitsController < BaseController
  def index
    @roots = Unit.find_by_parent_id(nil)
    respond_to do |format|
      format.json { render :json => { :content => @roots.to_node.to_json } }
    end
  end
end

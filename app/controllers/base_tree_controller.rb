class BaseTreeController < BaseController
  # Render as tree structure
  def tree
    @roots = Unit.find_all_by_parent_id(nil)
    respond_to do |format|
      format.json { render :json => { :content => @roots.map{ |u| u.to_node } } }
    end
  end
end

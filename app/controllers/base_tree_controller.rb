class BaseTreeController < BaseController
  # Render as tree structure
  def tree
    respond_to do |format|
      format.json { render :json => { :content => self.roots.map{ |u| u.to_node } } }
    end
  end
end

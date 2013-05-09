class BaseTreeModel < ActiveRecord::Base
  self.abstract_class = true
  attr_protected :lft, :rgt
  acts_as_nested_set


  # Helper for to_json: add children
  #
  # Adds children data to attribute "children"
  def to_node
    self.attributes.merge({:children => self.descendants.map {|c| c.to_node}})
  end


end

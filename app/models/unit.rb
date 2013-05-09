class Unit < BaseTreeModel
  attr_protected :created_at, :updated_at

  validates :name, presence: true
  validates :abbreviation, presence: true

  before_destroy :check_for_empty

  def read_attribute_for_validation(attr)
    return :unit if attr == :unit
    send(attr)
  end

  private

  # Return false when has child and put error message
  # 
  def check_for_empty
    if not self.leaf?
      errors.add(:unit, :not_empty)
      return false
    end
  end
end

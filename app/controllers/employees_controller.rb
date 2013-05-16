class EmployeesController < BaseController
  before_filter :set_default_sort, only: [:index]

  def index
    @search = Employee.joins(:person).includes(:person).search(params[:search])
    @employees = @search.paginate(page: params[:page])
  end

  private

  def set_default_sort
    params[:search] ||= {}
    params[:search][:meta_sort] ||= 'person_last_name.asc'
  end
end


class EmployeesController < BaseController

  def index
    params[:search] ||= {}
    params[:search][:meta_sort] ||= 'surname.asc'

    @search = Employee.search(params[:search])
    @employees = @search.paginate(page: params[:page])
  end

end


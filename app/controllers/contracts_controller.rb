# encoding: utf-8
# author: mbach

class ContractsController < BaseController

  before_filter(:set_default_sort,{only: [:index]})

  private

  def set_default_sort()
    params[:search] ||= {}
    params[:search][:meta_sort] ||= 'subject.asc'
  end

end
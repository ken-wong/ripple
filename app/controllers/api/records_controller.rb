class Api::RecordsController < Api::BaseController

  def list_with_month
    month = params[:month]
    begin_of_month = get_begin_of_month(month)
    @records = current_user.records.where(date: begin_of_month..begin_of_month.end_of_month)
  end

  private
    def get_begin_of_month(month)
      Date.parse(month + "01") rescue Date.today.beginning_of_month
    end
end
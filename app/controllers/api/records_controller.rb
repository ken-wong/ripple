class Api::RecordsController < Api::BaseController
  def list_with_month
    month = params[:month]
    begin_of_month = get_begin_of_month(month)
    @records = current_user.records.where(date: begin_of_month..begin_of_month.end_of_month).order(date: :asc)
    @dates = @records.pluck(:date)
  end

  def create
    begin
      date = Date.parse(params[:date]) 
    rescue 
      render json: {message: "日期非法"}, status: 422
    end
    project_ids = []
    project_ids = params[:project_ids]
    project_ids.each do |project_id|
      Record.create(
        user_id: current_user.id,
        date: date,
        project_id: project_id)
    end
    render json: {}, status: 201
  end

  private
    def get_begin_of_month(month)
      Date.parse(month + "01") rescue Date.today.beginning_of_month
    end
end
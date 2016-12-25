class Api::RecordsController < Api::BaseController
  def list_with_month
    month = params[:month]
    begin_of_month = get_begin_of_month(month)
    @records = current_user.records.where(date: begin_of_month..begin_of_month.end_of_month).order(date: :asc)
    @dates = @records.pluck(:date).uniq
  end

  def create
    begin
      date = Date.parse(params[:date]) 
    rescue 
      return render json: {message: "日期非法"}, status: 422
    end

    if date < Date.today && Record.find_by(date: date, user_id: current_user.id)
      return render json: {message: "不能变更"}, status: 422
    end

    if date == Date.today
      current_user.records.where(date: date).delete_all
    end

    if date > Date.today
      return render json: {message: "日期错误：不能填写未来日期"}, status: 422
    end

    records = []
    records = params[:records]
    
    if records.blank?
      return render json: {message: "项目id为空"}, status: 422
    end

    message = ""
    records.each do |record|
      if Project.find_by(id: record["project_id"])
        record = Record.new(user_id: current_user.id, date: date, project_id: record["project_id"], hour: record["hour"], remark: record["remark"])
        if record.save
        else
          message += "#{record}失败"
        end
      end
    end
    render json: {message: message}, status: 201
  end

  private
    def get_begin_of_month(month)
      Date.parse(month + "01") rescue Date.today.beginning_of_month
    end
end
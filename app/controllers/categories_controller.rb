
  scope :bw_dates_and_cat, lambda{|start_date,end_date,category_id| where("start_time >= ? and start_time <= ? and category_id = ?", start_date, end_date, category_id)}

  def index
  end

  def show
    time = DateTime.now
    @events = City.find_by_city(params[:city]).events.bw_dates_and_cat(time.beginning_of_week, time.end_of_week,params[:category_id]).order(start_time: :asc)
  end

  def year
    time = DateTime.new(params[:year])
    @events = City.find_by_city(params[:city]).events.bw_dates_and_cat(time, time.end_of_year,params[:category_id]).order(start_time: :asc)
  end

  def month
    time =DateTime.new(params[:year], params[:month])
    @events = City.find_by_city(params[:city]).bw_dates_and_cat(time, time.end_of_month,params[:category_id]).order(start_time: :asc)
  end

  def day
    time =DateTime.new(params[:year], params[:month],params[:day])
    @events = City.find_by_city(params[:city]).events.bw_dates_and_cat(time, time.end_of_day,params[:category_id]).order(start_time: :asc)
  end

  def week
    time = DateTime.commercial(DateTime.now.year,params[:week].to_i)
    @events = City.find_by_city(params[:city]).events.bw_dates_and_cat(time, time.end_of_week,params[:category_id]).order(start_time: :asc)
  end

  def topyear
    time = DateTime.new(params[:year])
    @events = City.find_by_city(params[:city]).events.bw_dates_and_cat(time, time.end_of_year).order(total_stars: :desc)
  end

  def topmonth
    time = DateTime.new(params[:year], params[:month])
    @events = City.find_by_city(params[:city]).events.bw_dates_and_cat(time, time.end_of_month).order(total_stars: :desc)
  end

end

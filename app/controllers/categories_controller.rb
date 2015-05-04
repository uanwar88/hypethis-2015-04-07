class CategoriesController < ApplicationController
  def index
  end

  def show
    # This retrieves the events for a given category in a given city for the current week
    time = DateTime.now
    @events = City.find_by_city(params[:city]).events.category(params[:category_id]).between_dates(time.beginning_of_week, time.end_of_week).order(start_time: :asc)
  end

  def year
    time = DateTime.new(params[:year])
    @events = City.find_by_city(params[:city]).events.category(params[:category_id]).between_dates(time, time.end_of_year).order(start_time: :asc)
    render :show
  end

  def month
    time =DateTime.new(params[:year], params[:month])
    @events = City.find_by_city(params[:city]).events.category(params[:category_id]).between_dates(time, time.end_of_month).order(start_time: :asc)
    render :show
  end

  def day
    time =DateTime.new(params[:year], params[:month],params[:day])
    @events = City.find_by_city(params[:city]).events.category(params[:category_id]).between_dates(time, time.end_of_day).order(start_time: :asc)
    render :show
  end

  def week
    # This allows you to find events for a selected week
    time = DateTime.commercial(DateTime.now.year,params[:week].to_i)
    @events = City.find_by_city(params[:city]).events.category(params[:category_id]).between_dates(time, time.end_of_week).order(start_time: :asc)
    render :show
  end

  def topyear
    time = DateTime.new(params[:year])
    @events = City.find_by_city(params[:city]).events.category(params[:category_id]).between_dates(time, time.end_of_year).order(stars_count: :desc)
    render :show
  end

  def topmonth
    time = DateTime.new(params[:year], params[:month])
    @events = City.find_by_city(params[:city]).events.category(params[:category_id]).between_dates(time, time.end_of_month).order(stars_count: :desc)
    render :show
  end

end

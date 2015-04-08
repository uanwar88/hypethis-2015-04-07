class CitiesController < ApplicationController
  def index
  end

  def show
    time = DateTime.now
    @events = City.find_by_name(params[:city]).events.
    where("start_time >= ? and start_time <= ?", time.beginning_of_week, time.end_of_week).order(start_time: :asc)
  end

  def year
    time = DateTime.new(params[:year])
    @events = City.find_by_name(params[:city]).events.
    where("start_time >= ? and start_time <= ?", time, time.end_of_year).order(start_time: :asc)
  end

  def month
    time =DateTime.new(params[:year], params[:month])
    @events = City.find_by_name(params[:city]).events.
    where("start_time >= ? and start_time <= ?", time, time.end_of_month).order(start_time: :asc)
  end

  def week
    time = DateTime.commercial(DateTime.now.year,params[:week].to_i)
    @events = City.find_by_name(params[:city]).events.
    where("start_time >= ? and start_time <= ?", time, time.end_of_week).order(start_time: :asc)
  end

  def topyear
    time = DateTime.new(params[:year])
    @events = City.find_by_name(params[:city]).events.
    where("start_time >= ? and start_time <= ?", time, time.end_of_year).
    order(total_stars: :desc)
  end

  def topmonth
    time = DateTime.new(params[:year], params[:month])
    @events = City.find_by_name(params[:city]).events.
    where("start_time >= ? and start_time <= ?", time, time.end_of_month).
    order(total_stars: :desc)
  end
end

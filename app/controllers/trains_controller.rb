class TrainsController < ApplicationController
  @@trains=nil

def index
  @trains=@@trains
  render "display"
end

def search

  source=params[:source]
  destination=params[:destination]
  date = Date.parse params[:date]
  session[:date]=date
    dt = Time.zone.at(date.to_time).to_datetime.in_time_zone("UTC")


    trains=Train.where(source: source,destination: destination,day: date.wday.to_s)


  trains.all.each do |tr|
    if Search.where(train: tr.trainno,travel_date: date).size == 0
        Search.create(train: tr.trainno,nom_seats: tr.nor_seats,win_seats: tr.win_seats,travel_date: date)
    end
  end

   @date=date
    puts date.wday
    @@trains=Train.where(source: source,destination: destination,day: date.wday.to_s)
    puts "haii"+@@trains.size.to_s
    puts source
    puts destination

  redirect_to trains_path
  end
end

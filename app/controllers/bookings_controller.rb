class BookingsController < ApplicationController

  def create
    trainno=params[:trainno].to_i
    nor_seats=params[:nor_seats].to_i
    win_seats=params[:win_seats].to_i
    date=Date.parse session[:date]

    puts nor_seats
    puts win_seats
    puts trainno

    val=Train.where(trainno: trainno)

    if Search.where(train: trainno,travel_date: date).size == 0
      Search.create(train: trainno,nom_seats: val[0].nor_seats,win_seats: val[0].win_seats,travel_date: date)
    end

    train=Search.where(train: trainno,travel_date: date)[0]

    flag1=false
    flag2=false
    if train.nom_seats-nor_seats>0
      train.nom_seats=train.nom_seats-nor_seats
    else
      wlnorseats=nor_seats-train.nom_seats
      train.nom_seats=0
      flag1=true
    end

    if train.win_seats-win_seats>0
      train.win_seats=train.win_seats-nor_seats
    else
      wlwinseats=nor_seats-train.win_seats
      train.win_seats=0
      flag2=true
    end


    price=val[0].price

    train.save!

    if flag1 or flag2
      status="waitlist"
    else
      status="confirm"
    end

    price=(nor_seats*price)+(win_seats*price*1.1)

    Booking.create(trainno: trainno,nor_seats: nor_seats,win_seats: win_seats,price: price,
                  status: status,userid: 1,date: date,win_seats_wl: wlwinseats,nor_seats_wl:wlnorseats)

    redirect_to bookings_path

  end

  def index
    render "display"
  end

  def cancel
    id = params[:id].to_i
    booking=Booking.find(id)


    trainno=booking.trainno
    date=booking.date
    win_seats=booking.win_seats-booking.win_seats_wl
    nor_seats=booking.nor_seats-booking.nor_seats_wl

    booking.status="cancel"
    booking.save

    person=Booking.where(status:"waitlist",date: date,trainno: trainno).order(:created_at)

    person.all.each do |p|

      if win_seats==0 and nor_seats==0
        break
      end

      if win_seats-p.win_seats_wl>0
        p.win_seats_wl=0
      else
        p.win_seats_wl=p.win_seats_wl-win_seats
        win_seats=0
      end

      if nor_seats-p.nor_seats_wl>0
        p.nor_seats_wl=0
      else
        p.nor_seats_wl=p.nor_seats_wl-win_seats
        nor_seats=0
      end
    end
    redirect_to bookings_path
  end



end

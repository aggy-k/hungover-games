class Api::V1::TimeslotsController < Api::V1::BaseController

  def index
    @timeslots = Timeslot.all
  end
end

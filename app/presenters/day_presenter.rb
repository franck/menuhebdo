class DayPresenter

  def initialize(day)
    @day = day
  end

  def name
    "Jour #{@day.position}"
  end
end

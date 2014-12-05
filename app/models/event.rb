class Event < ActiveRecord::Base
  belongs_to :user

  extend SimpleCalendar
  has_calendar :attribute => :date

  validates :title, presence: true
  validates :date, presence: true
  validates :content, presence: true

  # Or set a custom attribute for simple_calendar to sort by
  # has_calendar :attribute => :your_starting_time_column_name

  def self.sort_by_date
    Event.order(:date)

  end

  def future_event?
    future_event = []
    Event.sort_by_date.each do |e|
      if e.date.future?
        future_event << e
      end
      future_event
    end

  end

  def ten_future_events
    future_event?.arr[0..9]
  end


end

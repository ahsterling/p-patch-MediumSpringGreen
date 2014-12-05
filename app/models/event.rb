class Event < ActiveRecord::Base
  belongs_to :user

  extend SimpleCalendar
  has_calendar :attribute => :date

  validates :title, presence: true
  validates :date, presence: true
  validates :content, presence: true

  # Or set a custom attribute for simple_calendar to sort by
  # has_calendar :attribute => :your_starting_time_column_name
end

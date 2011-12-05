class Test < ActiveRecord::Base
  validates_presence_of :number
  validates_uniqueness_of :number, :scope => :a_date
  before_validation :print_values

  def print_values
    puts "In before_validation:"
    puts "  - published is #{published} with type #{published.class}"
    puts "  - a_date is #{a_date} with type #{a_date.class}"
    puts "  - a_date_time is #{a_date_time} with type #{a_date_time.class}"
  end
end

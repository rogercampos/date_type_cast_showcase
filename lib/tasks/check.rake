task :check => :environment do
  Test.delete_all

  a = Test.new :number => 1,
    :a_date => "13-8-1985",
    :a_date_time => "13-8-1985 12:53:45",
    :published => "1"

  a.save!

  datetime = Time.new 1985, 8, 13, 13,30,0, "+01:00"

  b = Test.new :number => 1,
    :a_date => datetime, # Typecast to Date not issued when we directly assign a time object
    #:a_date => "13-8-1985 11:23:15", # However if we assign a time as string the typecast is performed
    :a_date_time => "13-8-1985 12:53:45",
    :published => "1"

  b.save!  # => Should fail due to uniqueness of :number, :scope => :a_date, but not.

  puts "-----"
  a.reload
  b.reload
  p a.valid?
  p b.valid? # => false, We have persisted an invalid object
end

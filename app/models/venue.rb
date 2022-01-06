class Venue < ActiveRecord::Base
    has_many :concerts
    has_many :bands, through: :concerts

    def concert_on(date)
        concert = Concert.find_by(date: date, venue: venue).first
    end

    def most_frequent_band
        Bands.all.includes(:concerts).max_by {|band| band.concerts.length}
    end

end
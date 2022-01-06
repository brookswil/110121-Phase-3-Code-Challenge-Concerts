class Band < ActiveRecord::Base
    has_many :concerts
    has_many :venues, through: :concerts

    def play_in_venue(venue, date)
        Concert.create(
            band_id: band.id,
            venue_id: venue.id,
            date: date
        )
    end

    def all_introductions
        ary = []
        ary.push(@intro)
    end

    def self.most_performances
        Bands.all.includes(:concerts).max_by {|band| band.concerts.length}
    end

end
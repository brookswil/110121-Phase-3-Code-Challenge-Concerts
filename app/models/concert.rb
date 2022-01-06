class self < ActiveRecord::Base
   belongs_to :band
   belongs_to :venue

   def hometown_show?
        if self.venue.city == self.band.hometown
            puts true
        else
            puts false
        end
   end

   def introduction
        @intro = "Hello#{self.venue.city}!!!!! We are #{self.band.name} and we're from #{self.band.hometown}"
   end

end
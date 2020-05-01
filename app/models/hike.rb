class Hike < ActiveRecord::Base 
    belongs_to :user
    has_many :comments 

    def slug
        name.downcase.gsub(" ","-")
      end
    
      def self.find_by_slug(slug)
        Hike.all.find{|hike| hike.slug = slug}
      end
end
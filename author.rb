    class Author
        attr_reader :name
      
        def initialize(name)
          @name = name
          @contributions = []
        end
      
        def add_contribution(article)
          @contributions << article
        end


        def add_article(magazine, title)
            article = Article.new(self, magazine, title)
            @contributions << article
            magazine.add_article(article)
          end
      
        def articles
          @contributions
        end

        def topic_areas
            magazines.flat_map { |magazine| magazine.categories }.uniq
        end
      
        def magazines
          @contributions.map { |article| article.magazine }.uniq
        end
      end



      class Magazine
        attr_accessor :name, :category, :authors
        @@all = []
      
        def initialize(name, category)
          @name = name
          @category = category
          @authors = []
        end
      
        def add_article(article)
          author = article.author
          unless authors.include?(author)
            authors << author
          end
        end
      
        def self.all
          @@all
        end
      
        def self.find_by_name(name)
          self.all.find { |magazine| magazine.name == name }
        end
      
        def contributors
          authors

        end
        def article_titles
            articles.map(&:title)
          end
        
          def articles
            Article.all.select { |article| article.magazine == self }
          end
          def contributing_authors
            author_counts = Hash.new(0)
            articles.each { |article| author_counts[article.author] += 1 }
            author_counts.select { |author, count| count > 2 }.keys
          end
        
          def articles
            Article.all.select { |article| article.magazine == self }
          end

      end
      



class Article

    @@all = []
    attr_reader :author, :magazine, :title
        def initialize(author,magazine,title)
            @author = author
            @magazine = magazine
            @title = title
            @@all << self
        end
    def self.all
        @@all
    end
    def author
        @author
    end
    
      def magazine
        @magazine
      end
end
#creating author
    author1=Author.new("jac")
    author2= Author.new(" ann")
    author3= Author.new(" mac")
puts author1
puts author2
puts author3

# creating magazine
magazineee1=Magazine.new("Kenya Time","political")
magazineee2=Magazine.new("Taifa leo","sports")
puts magazineee1.name
puts magazineee2.name 
puts magazineee1.category
puts magazineee2.category


#adding articles
article1=author1.add_article(magazineee1,"election year")
article2=author2.add_article(magazineee1,"election year")
article3=author3.add_article(magazineee1,"election year") 

#


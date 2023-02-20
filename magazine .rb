
class Author
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
       
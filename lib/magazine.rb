
class Magazine
    attr_accessor :name, :category, :authors
    @@all = []
  
    def initialize(name, category)
      @name = name
      @category = category
      @authors = []
      @@all << self

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
  
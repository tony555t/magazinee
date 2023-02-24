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
            magazines.flat_map { |magazine| magazine.category }.uniq
        end
      
        def magazines
          @contributions.map { |article| article.magazine }.uniq
        end
      end






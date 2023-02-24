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






#creating author
    author1=Author.new("jac")
    author2= Author.new(" ann")
    author3= Author.new(" mac")
    author4= Author.new("mic")
puts author1
puts author2
puts author3
puts author4

# creating magazine
magazineee1=Magazine.new("Kenya Time","political")
magazineee2=Magazine.new("Taifa leo","sports")
puts magazineee1.name
puts magazineee2.name 
puts magazineee1.category
puts magazineee2.category


#adding articles
article1=author1.add_article(magazineee1,"election year")
article2=author2.add_article(magazineee2,"election year")
article3=author3.add_article(magazineee1,"election year") 
article3=author4.add_article(magazineee1,"election year") 


#topic

puts author2.topic_areas
puts author4.topic_areas

#magazine by name
magazine=Magazine.find_by_name("Taifa leo")
puts magazine.name

# Output: ["The History of Baseball"]
puts magazine1.article_titles

puts magazine1.contributing_authors.map { |author| author.name }
# Output: ["John Smith"]




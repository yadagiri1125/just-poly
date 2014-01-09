namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
   # require 'faker'

    [Editorial,Post].each(&:delete_all)

    Editorial.populate 200 do |editorial|
      editorial.title = Populator.words(1..3).titleize
      editorial.content = Populator.sentences(2..10)


# these lines to pupulate associated objects here if editorial has many products then following lines will work out
   #  Product.populate 10..100 do |product|
    #   product.category_id = category.id
     #   product.name = Populator.words(1..5).titleize
      # product.description = Populator.sentences(2..10)
      #product.price = [4.99, 19.95, 100]
       # product.created_at = 2.years.ago..Time.now
     #end

     # Populator.words(3) # generates 3 random words separated by spaces
     # Populator.words(10..20) # generates between 10 and 20 random words
     # Populator.sentences(5) # generates 5 sentences
     # Populator.paragraphs(3) # generates 3 paragraphs

    #  Usage

     # This gem adds a “populate” method to all Active Record models. Pass the number of records you want to create along with a block. In the block you can set the column values for each record.

    #      Person.populate(3000) do |person|
     #     person.first_name = "John"
      #person.last_name = "Smith"
                                                                                                                                                                                  end
      #This will do a mass insert into the database so it is very fast. The person object contains the “id” so you can set up associations.

                                                                                                                                 Person.populate(3000) do |person|
       # person.first_name = "John"
        #person.last_name = "Smith"
        #Project.populate(30) do |project|
         # project.person_id = person.id
        #end
      #end
      #That will create 30 projects for each person.

       #   Passing a range or array of values will randomly select one.
#
 #                                                                     Person.populate(1000..5000) do |person|
  #        person.gender = ['male', 'female']
   #   person.annual_income = 10000..200000
                  #                 end
    #  This will create 1000 to 5000 men or women with the annual income between 10,000 and 200,000.
#
 #             You can pass a :per_query option to limit how many records are saved per query. This defaults to 1000.
#
   #                                                                                                                Person.populate(2000, :per_query => 100)
  #    If you need to generate fake data, there are a few methods to do this.
#
 #         Populator.words(3) # generates 3 random words separated by spaces
  #    Populator.words(10..20) # generates between 10 and 20 random words
   #   Populator.sentences(5) # generates 5 sentences
    #  Populator.paragraphs(3) # generates 3 paragraphs


    end

    Post.populate 100 do |person|
      person.title    = Faker::Name.name
      person.content = Faker::Company.name
    end


end

end
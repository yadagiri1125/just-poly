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



    end

    Post.populate 100 do |person|
      person.title    = Faker::Name.name
      person.content = Faker::Company.name
    end


end

end
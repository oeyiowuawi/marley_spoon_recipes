
namespace :marley_spoon do
  desc "sync the recipes from contentful api"

  task sync_recipes: :environment do
    processor = RecipeProcessor.new
    processor.call
    puts "#{processor.recipe_count} #{'recipe'.pluralize(processor.recipe_count)} processed"
  end
end
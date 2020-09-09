require 'rails_helper'
require 'rake'

describe 'sync recipes' do
  before do
    load Rails.root.join('lib/tasks/sync_recipes.rake')
    Rake::Task.define_task(:environment)
  end

  after { Rake.application.clear }

  it 'syncs the recipe store with the data from the contentful apu' do
    service = ContentfulService.new
    allow(ContentfulService).to receive(:new).and_return(service)
    store = RecipeDataStore.new(db: recipe_test_db)
    allow(RecipeDataStore).to receive(:new).and_return(store)
    allow(service).to receive(:fetch_recipes).and_return(recipe_raw_data)
    task = Rake::Task['marley_spoon:sync_recipes']

    expect { task.invoke }.to output(
      /1 recipe processed/
    ).to_stdout
  end

end
require 'rails_helper'
require 'rake'

RSpec.describe 'sync recipes' do
  before do
    load Rails.root.join('lib/tasks/sync_recipes.rake')
    Rake::Task.define_task(:environment)
  end

  after { Rake.application.clear }

  it 'syncs the recipe store with the data from the contentful apu' do
    service = ContentfulService.new
    allow(ContentfulService).to receive(:new).and_return(service)
    allow(service).to receive(:fetch_recipes).and_return(raw_recipe_data)
    task = Rake::Task['marley_spoon:sync_recipes']

    expect { task.invoke }.to output(
      /1 recipe processed/
    ).to_stdout
  end

end
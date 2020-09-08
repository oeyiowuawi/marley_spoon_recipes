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
    allow(ContentfulService).to recieve(:new).and_return(service)
    allow(serice).to receive(:fetch_recipes).and_return(raw_recipe_data)
    task = Rake::Task['marley_spoon:sync_recipes']

    expect { task.invoke }.to output(
      /1 recipe processed/
    ).to_stdout
  end

  def raw_recipe_data
    {"sys"=>{"type"=>"Array"},
 "total"=>1,
 "skip"=>0,
 "limit"=>100,
 "items" => [
  {"sys"=>
  {"space"=>{"sys"=>{"type"=>"Link", "linkType"=>"Space", "id"=>"kk2bw5ojx476"}},
   "id"=>"4dT8tcb6ukGSIg2YyuGEOm",
   "type"=>"Entry",
   "createdAt"=>"2018-05-07T13:38:22.351Z",
   "updatedAt"=>"2018-05-07T13:41:01.986Z",
   "environment"=>{"sys"=>{"id"=>"master", "type"=>"Link", "linkType"=>"Environment"}},
   "revision"=>2,
   "contentType"=>{"sys"=>{"type"=>"Link", "linkType"=>"ContentType", "id"=>"recipe"}},
   "locale"=>"en-US"},
 "fields"=>
  {"title"=>"White Cheddar Grilled Cheese with Cherry Preserves & Basil",
   "photo"=>{"sys"=>{"type"=>"Link", "linkType"=>"Asset", "id"=>"61XHcqOBFYAYCGsKugoMYK"}},
   "calories"=>788,
   "description"=>
    "*Grilled Cheese 101*: Use delicious cheese and good quality bread; make crunchy on the outside and ooey gooey on the inside; add one or two ingredients for a flavor punch! In this case, cherry preserves serve as a sweet contrast to cheddar cheese, and basil adds a light, refreshing note. Use __mayonnaise__ on the outside of the bread to achieve the ultimate, crispy, golden-brown __grilled cheese__. Cook, relax, and enjoy!",
   "tags"=>[{"sys"=>{"type"=>"Link", "linkType"=>"Entry", "id"=>"3RvdyqS8408uQQkkeyi26k"}}]}}
 ],
  "includes" => {
    "Entry" => [
      {"sys"=>
       {"space"=>{"sys"=>{"type"=>"Link", "linkType"=>"Space", "id"=>"kk2bw5ojx476"}},
        "id"=>"3RvdyqS8408uQQkkeyi26k",
        "type"=>"Entry",
        "createdAt"=>"2018-05-07T13:27:45.974Z",
        "updatedAt"=>"2018-05-07T13:27:45.974Z",
        "environment"=>{"sys"=>{"id"=>"master", "type"=>"Link", "linkType"=>"Environment"}},
        "revision"=>1,
        "contentType"=>{"sys"=>{"type"=>"Link", "linkType"=>"ContentType", "id"=>"tag"}},
        "locale"=>"en-US"},
      "fields"=>{"name"=>"vegan"}}
    ]
  }
}
  end

end
module RecipeTestData

  def recipe_raw_data
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
   "chef"=>{"sys"=>{"type"=>"Link", "linkType"=>"Entry", "id"=>"NysGB8obcaQWmq0aQ6qkC"}},
      "tags"=>
       [{"sys"=>{"type"=>"Link", "linkType"=>"Entry", "id"=>"3RvdyqS8408uQQkkeyi26k"}},
        {"sys"=>{"type"=>"Link", "linkType"=>"Entry", "id"=>"gUfhl28dfaeU6wcWSqs0q"}}]
   }}
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
      "fields"=>{"name"=>"vegan"}},
      {"sys"=>
   {"space"=>{"sys"=>{"type"=>"Link", "linkType"=>"Space", "id"=>"kk2bw5ojx476"}},
    "id"=>"gUfhl28dfaeU6wcWSqs0q",
    "type"=>"Entry",
    "createdAt"=>"2018-05-07T13:26:53.870Z",
    "updatedAt"=>"2018-05-07T13:27:08.774Z",
    "environment"=>{"sys"=>{"id"=>"master", "type"=>"Link", "linkType"=>"Environment"}},
    "revision"=>2,
    "contentType"=>{"sys"=>{"type"=>"Link", "linkType"=>"ContentType", "id"=>"tag"}},
    "locale"=>"en-US"},
  "fields"=>{"name"=>"healthy"}}
    ],
    "Asset" => [
      {"sys"=>
  {"space"=>{"sys"=>{"type"=>"Link", "linkType"=>"Space", "id"=>"kk2bw5ojx476"}},
   "id"=>"61XHcqOBFYAYCGsKugoMYK",
   "type"=>"Asset",
   "createdAt"=>"2018-05-07T13:37:53.784Z",
   "updatedAt"=>"2018-05-07T13:37:53.784Z",
   "environment"=>{"sys"=>{"id"=>"master", "type"=>"Link", "linkType"=>"Environment"}},
   "revision"=>1,
   "locale"=>"en-US"},
 "fields"=>
  {"title"=>"SKU1240 hero-374f8cece3c71f5fcdc939039e00fb96",
   "file"=>
    {"url"=>
      "//images.ctfassets.net/kk2bw5ojx476/61XHcqOBFYAYCGsKugoMYK/0009ec560684b37f7f7abadd66680179/SKU1240_hero-374f8cece3c71f5fcdc939039e00fb96.jpg",
     "details"=>{"size"=>194737, "image"=>{"width"=>1020, "height"=>680}},
     "fileName"=>"SKU1240_hero-374f8cece3c71f5fcdc939039e00fb96.jpg",
     "contentType"=>"image/jpeg"}}},

    ]
  }
}
  end

end
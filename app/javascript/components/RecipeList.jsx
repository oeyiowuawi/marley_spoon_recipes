import React, { Component } from "react";
import lodash from 'lodash';
import RecipeGroup from "./RecipeGroup"

class RecipeList extends Component {

  state = {
    recipes: [
      { id: "lekan",
        description: "*Grilled Cheese 101*: Use delicious cheese and good quality bread; make crunchy on the outside and ooey gooey on the inside; add one or two ingredients for a flavor punch! In this case, cherry preserves serve as a sweet contrast to cheddar cheese, and basil adds a light, refreshing note. Use __mayonnaise__ on the outside of the bread to achieve the ultimate, crispy, golden-brown __grilled cheese__. Cook, relax, and enjoy!",
        title: "White Cheddar Grilled Cheese with Cherry Preserves & Basil", chef_name: "Jony Chives",
        tags: ["vegan"], photo_url:  "//images.ctfassets.net/kk2bw5ojx476/3TJp6aDAcMw6yMiE82Oy0K/2a4cde3c1c7e374166dcce1e900cb3c1/SKU1503_Hero_102__1_-6add52eb4eec83f785974ddeac3316b7.jpg"
      },
      {
        id: "5jy9hcMeEgQ4maKGqIOYW6",
        description:  "Saag paneer is a popular Indian dish with iron-rich spinach and cubes of paneer, an Indian cheese that is firm enough to retain it's shape, but silky-soft on the inside. We have reimagined Saag Paneer and replaced the \"paneer\" with crispy cubes of firm tofu, making this already delicious and nutritious vegetarian dish burst with protein. Toasted pita bread is served alongside as an ode to naan. Cook, relax, and enjoy! [VIDEO](https://www.youtube.com/watch?v=RMzWWwfWdVs)",
        title: "Tofu Saag Paneer with Buttery Toasted Pita", tags: ["gluten free", "healthy"], chef_name: "Mark Zucchiniberg ",
        photo_url:  "//images.ctfassets.net/kk2bw5ojx476/48S44TRZN626y4Wy4CuOmA/9c0a510bc3d18dda9318c6bf49fac327/SKU1498_Hero_154__2_-adb6124909b48c69f869afecb78b6808-2.jpg",
      },
      {
        id: "5jy9hcMeEgQ4maKGqIOYW6",
        description:  "Saag paneer is a popular Indian dish with iron-rich spinach and cubes of paneer, an Indian cheese that is firm enough to retain it's shape, but silky-soft on the inside. We have reimagined Saag Paneer and replaced the \"paneer\" with crispy cubes of firm tofu, making this already delicious and nutritious vegetarian dish burst with protein. Toasted pita bread is served alongside as an ode to naan. Cook, relax, and enjoy! [VIDEO](https://www.youtube.com/watch?v=RMzWWwfWdVs)",
        title: "Tofu Saag Paneer with Buttery Toasted Pita", tags: ["gluten free", "healthy"], chef_name: "Mark Zucchiniberg ",
        photo_url:  "//images.ctfassets.net/kk2bw5ojx476/48S44TRZN626y4Wy4CuOmA/9c0a510bc3d18dda9318c6bf49fac327/SKU1498_Hero_154__2_-adb6124909b48c69f869afecb78b6808-2.jpg",
      },
      {
        id: "5jy9hcMeEgQ4maKGqIOYW6",
        description:  "Saag paneer is a popular Indian dish with iron-rich spinach and cubes of paneer, an Indian cheese that is firm enough to retain it's shape, but silky-soft on the inside. We have reimagined Saag Paneer and replaced the \"paneer\" with crispy cubes of firm tofu, making this already delicious and nutritious vegetarian dish burst with protein. Toasted pita bread is served alongside as an ode to naan. Cook, relax, and enjoy! [VIDEO](https://www.youtube.com/watch?v=RMzWWwfWdVs)",
        title: "Tofu Saag Paneer with Buttery Toasted Pita", tags: ["gluten free", "healthy"], chef_name: "Mark Zucchiniberg ",
        photo_url:  "//images.ctfassets.net/kk2bw5ojx476/48S44TRZN626y4Wy4CuOmA/9c0a510bc3d18dda9318c6bf49fac327/SKU1498_Hero_154__2_-adb6124909b48c69f869afecb78b6808-2.jpg",
      },
      {
        id: "5jy9hcMeEgQ4maKGqIOYW6",
        description:  "Saag paneer is a popular Indian dish with iron-rich spinach and cubes of paneer, an Indian cheese that is firm enough to retain it's shape, but silky-soft on the inside. We have reimagined Saag Paneer and replaced the \"paneer\" with crispy cubes of firm tofu, making this already delicious and nutritious vegetarian dish burst with protein. Toasted pita bread is served alongside as an ode to naan. Cook, relax, and enjoy! [VIDEO](https://www.youtube.com/watch?v=RMzWWwfWdVs)",
        title: "Tofu Saag Paneer with Buttery Toasted Pita", tags: ["gluten free", "healthy"], chef_name: "Mark Zucchiniberg ",
        photo_url:  "//images.ctfassets.net/kk2bw5ojx476/48S44TRZN626y4Wy4CuOmA/9c0a510bc3d18dda9318c6bf49fac327/SKU1498_Hero_154__2_-adb6124909b48c69f869afecb78b6808-2.jpg",
      }
        
    ],
    perPage: 8,
    currentPage: 1
  }

  getIndexOfLastRecipe = () => {
    return this.state.currentPage * this.state.perPage; 
  }

  getIndexOfFirstDev = () => {
    return this.getIndexOfLastRecipe() - this.state.perPage;
  }

  getCurrentRecipes = () => {
    const firstIndex = this.getIndexOfFirstDev();
    const lastIndex = this.getIndexOfLastRecipe();
    console.log(firstIndex, lastIndex, "talent")
    return this.state.recipes.slice(firstIndex, lastIndex)
  }

  render() {
    let groupedRecipeList = [];
    let result = [];
    // let currentRecipes = this.state.recipes;
    console.log(this.state.recipes, "story problem")
    if(this.state.recipes.length > 1) {
      let currentRecipes = this.getCurrentRecipes();
      groupedRecipeList = lodash.chunk(currentRecipes, 4);
      result = groupedRecipeList.map((groupedList, index) => {
        return <RecipeGroup group={groupedList} key={index} />
      })
    }

    return(
      <div className="container">
         <h1> Marley Spoon Recipes</h1>
         <hr />
        { result }
       {/* { pagination } */}
      </div>
    )
  }
}

export default RecipeList;
import React, { Component } from "react";
import lodash from 'lodash';
import RecipeGroup from "./RecipeGroup"
import Pagination from "./Pagination"

class RecipeList extends Component {

  state = {
    recipes: [],
    perPage: 8,
    currentPage: 1
  }

  fetchRecipes = () => {
    fetch("/recipes").then(response => { 
      if(response.ok) {
        return response.json();
      } else {
        throw new Error(response.statusText);
      }
       })
    .then(recipes =>  this.setState({ recipes: recipes}))
    .catch(error => console.log(error));
  }

  componentDidMount() {
    this.fetchRecipes();
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

  paginate = (number, event) => {
    event.preventDefault();
    this.setState({
      currentPage: number
    })
  }

  render() {
    let groupedRecipeList = [];
    let result = [];
    let pagination = null
    if(this.state.recipes.length > 1) {
      let currentRecipes = this.getCurrentRecipes();
      groupedRecipeList = lodash.chunk(currentRecipes, 4);
      result = groupedRecipeList.map((groupedList, index) => {
        return <RecipeGroup group={groupedList} key={index} />
      })

      pagination = <Pagination perPage={this.state.perPage}
                               totalRecipes={this.state.recipes.length}
                               paginate={this.paginate}
                               currentPage={this.state.currentPage} />
    }

    return(
      <div className="container">
         <h1> Marley Spoon Recipes</h1>
         <hr />
        { result }
       { pagination }
      </div>
    )
  }
}

export default RecipeList;
import React, { Component } from 'react';
import RecipeCard from './RecipeCard'

class RecipeGroup extends Component {
  render() {
    const recipes = this.props.group.map((recipe, index) => {
      return <RecipeCard recipe={recipe} key={index} />
    })
    return(
      <div className="row">
       { recipes }
      </div>
    )
  }
}

export default RecipeGroup;
import React, { Component } from 'react';
import Recipe from './Recipe'

class RecipeGroup extends Component {
  render() {
    const recipes = this.props.group.map((recipe, index) => {
      return <Recipe recipe={recipe} key={index} />
    })
    return(
      <div className="row">
       { recipes }
      </div>
    )
  }
}

export default RecipeGroup;
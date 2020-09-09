import React, { Component } from "react";
import Header from "./Header"

class Recipe extends Component {

  state = {
    recipe: { chef_name: "" }
  }

  fetchRecipe = () => {
    let id = this.props.match.params.id
    fetch("/recipes/" + id).then(response => { 
      if(response.ok) {
        return response.json();
      } else {
        throw new Error(response.statusText);
      }
       })
    .then(recipe =>  this.setState({ recipe: recipe}))
    .catch(error => console.log(error));
  }

  componentDidMount(){
    this.fetchRecipe();
  }

  render() {
    console.log(this.props, "this is the props")
    let { recipe } = this.state;
    let tags = []
    console.log(this.props.match.params.id, "this is the props")
    if(recipe.tags) {
      tags = recipe.tags.map((tag, index) => {
        return <span className="badge badge-secondary" key={index}>{tag}</span>
      })

    }
    return(
      <>
      <Header />
      <div className="container">
      <h1> {recipe.title} {tags}</h1>
      <hr />
      <div className="card" >
        <div className="recipe-image">
          <img className="card-img-top " src={recipe.photo_url} alt="Card image cap" />

        </div>
        <div className="card-body">
          <p className="card-text">{recipe.description}</p>
          {recipe.chef_name.length > 1 ? (<p className="card-text">chef: {recipe.chef_name}</p>) : null}
          
          
        </div>
      </div>
      
     </div>
    </>
    )
  }
}

export default Recipe;
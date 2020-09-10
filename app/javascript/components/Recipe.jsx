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
    let { recipe } = this.state;
    let tags = []
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
      <div className="recipe-image">
        <img className="card-img-top " src={recipe.photo_url} alt="Card image cap" />

      </div>
      <ul class="list-group list-group-flush">
        <li class="list-group-item"><strong>Description: </strong> {recipe.description} </li>
        {recipe.chef_name.length > 1 ? (<li class="list-group-item"><strong>Chef's name: </strong> {recipe.chef_name}</li>) : null}
      </ul>
     </div>
    </>
    )
  }
}

export default Recipe;
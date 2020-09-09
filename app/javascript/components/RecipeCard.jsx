import React, { Component } from 'react';
import { withRouter } from 'react-router'
import './styles.scss';

class RecipeCard extends Component {

  onClickHandler = (recipe, event) => {
    event.preventDefault();
    console.log(this.props, "yuiopoiuyyuiooi")
  }

  render() {
    let { recipe } = this.props;
    return(
      <div className="col-sm-3 recipe" onClick={(event)=> this.onClickHandler(recipe, event)}>
        <div className="card">
          <img src={recipe.photo_url} className="card-img-top" alt="..." />
          <div className="card-body">
            <h5 className="card-title">{ recipe.title }</h5>
          </div>
        </div>
      </div>
    )
  }
}

export default withRouter(RecipeCard);
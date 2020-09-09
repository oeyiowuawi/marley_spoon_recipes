import React from 'react';
import './styles.scss';

const Recipe = ({ recipe }) => {
  return(
    <div className="col-sm-3 recipe">
      <div className="card">
        <img src={recipe.photo_url} className="card-img-top" alt="..." />
        <div className="card-body">
          <h5 className="card-title">{ recipe.title }</h5>
        </div>
      </div>
    </div>
  )
}

export default Recipe;
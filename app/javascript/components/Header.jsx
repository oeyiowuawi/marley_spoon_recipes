import React from 'react';

const Header = () =>(
  <nav className="navbar fixed-to navbar-dark bg-dark justify-content-between">
    <a className="navbar-brand">Marley Spoon Recipes</a>
    <form className="form-inline">
      <input className="form-control mr-sm-2" type="search" placeholder="Search by recipe name" />
      <button className="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </nav>
)

export default Header;
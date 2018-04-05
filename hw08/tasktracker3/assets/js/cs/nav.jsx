import React from 'react';
import { connect } from 'react-redux';
import { NavLink } from 'react-router-dom';
import { NavItem, Form, FormGroup, Input, Button } from 'reactstrap';

import api from '../api';


let LoginForm = connect(({login}) => {return {login};})((props) => {

function update(ev){

  let tgt = $(ev.target);
  let data = {};
  data[tgt.attr('name')] = tgt.val();
  props.dispatch({
    type: 'UPDATE_LOGIN_FORM',
    data: data,
  });
}

function create_token(ev) {
    ev.preventDefault();
    api.submit_login(props.login);
}




  return <div className="navbar-text">
    <Form inline>
      <FormGroup>
        <input type="text" name="name" placeholder="name"
          value={props.login.name} onChange={update} />
      </FormGroup>
      <FormGroup>
        <input type="password" name="pass" placeholder="password"
          value={props.login.pass} onChange={update} />
      </FormGroup>
      <Button color = "secondary" onClick={create_token}>Login</Button>
    </Form>
  </div>;
});


let Session = connect(({token}) => {return {token};})((props) => {
  function logout_token(ev) {
      ev.preventDefault();
      api.submit_logout(props.login);
  }
  return <div className="navbar-text">
  User id = { props.token.user_id }
  <Button onClick={logout_token} color="primary">
  Logout
</Button>
</div>;
});

function Nav(props) {
let session_info;

if (props.token) {
  session_info = <Session />;
}

else {
  session_info = <LoginForm />;
}

return <nav className="navbar navbar-dark bg-dark navbar-expand">
  <span className="navbar-brand">
    TaskTracker
  </span>
  <ul className="navbar-nav mr-auto">
  <NavItem>
    <NavLink to="/" exact={true} activeClassName="active" className="nav-link">
    Tasks
    </NavLink>
  </NavItem>
  <NavItem>
    <NavLink to="/users" exact={false} activeClassName="active" className="nav-link">
    Users
    </NavLink>

  </NavItem>
  <NavItem>
    <NavLink to="/register" exact={false} activeClassName="active" className="nav-link">
    Register
    </NavLink>

  </NavItem>
  </ul>
    { session_info }
</nav>;
}


function state2props(state){
  return { token: state.token };
}

export default connect(state2props)(Nav);

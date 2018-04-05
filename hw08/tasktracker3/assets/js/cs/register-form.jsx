import React from 'react';
import { connect } from 'react-redux';
import { Checkbox, Button, FormGroup, Label, Input } from 'reactstrap';
import api from '../api';

function RegisterForm(props) {

  function update(ev) {
    let tgt = $(ev.target);

    let data = {};
    data[tgt.attr('name')] = tgt.val();
    let action = {
      type: 'UPDATE_REGFORM',
      data: data,
    };
    console.log(action);
    props.dispatch(action);
  }

  function clear() {
    props.dispatch({type: 'CLEAR_FORM'});

  }


  function submit(){
    api.submit_user(props.regform);
    clear();
  }



  return <div style={{padding: "4ex"}}>
    <h2>Register</h2>

    <FormGroup>

      <Input type="text_input" name="name" placeholder= "name" value={props.regform.name}
        onChange={update}/>

    </FormGroup>

    <FormGroup>
      <input type="password" name="password" placeholder="password"
        value={props.regform.password} onChange={update} />
    </FormGroup>

    <FormGroup>
      <input type="password" name="password_confirmation" placeholder="confirm password"
        value={props.regform.password_confirmation} onChange={update} />
    </FormGroup>


    <Button onClick={submit} color="primary">Register</Button> &nbsp;
      <Button onClick = {clear}>Clear</Button>
    </div>;
  }

  function state2props(state){
    return{
      regform: state.regform,
    };
  }
  export default connect(state2props)(RegisterForm);

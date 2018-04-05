import { createStore, combineReducers } from 'redux';
import deepFreeze from 'deep-freeze';


function token(state = null, action) {
  switch (action.type) {
    case 'SET_TOKEN':
     return action.token;
    case 'LOGOUT_TOKEN':
    action.token = null;
      return action.token;
    default:
     return state;
  }
}

let empty_login = {
  name: "",
  pass: "",
};

let empty_regform = {
  name: "",
  password: "",
  password_confirmation: "",
};

function login(state = empty_login, action) {
  switch (action.type) {
    case 'UPDATE_LOGIN_FORM':
      return Object.assign({}, state, action.data);
    default:
      return state;
  }
}

function users(state = [], action){
  switch(action.type){
    case 'USERS_LIST':
      return [...action.users];
    case 'ADD_USER':
      console.log("ADD_USER");
      console.log(action.user);
      return [action.user, ...state];
    default:
      return state;
  }
}

function tasks(state = [], action){
  switch(action.type){
    case 'TASKS_LIST':
      return [...action.tasks];
    case 'ADD_TASK':
      return [action.task, ...state];
    default:
      return state;
  }
}

let empty_form = {
  user_id: "",
  title: "",
  description: "",
  time: "",
  completed: "",

};

function form(state = empty_form, action){
  switch (action.type){
    case 'UPDATE_FORM':
      return Object.assign({}, state, action.data);
    case 'CLEAR_FORM':
      return empty_form;
    default:
      return state;
  }
}

function regform(state = empty_regform, action){
  switch (action.type){
    case 'UPDATE_REGFORM':
      return Object.assign({}, state, action.data);
    case 'CLEAR_FORM':
      return empty_regform;
    default:
      return state;
  }
}

function root_reducer(state0, action){

  console.log("state0", state0);
  console.log("action", action);
  let reducer = combineReducers({users, tasks, form, regform, login, token});
  let state1 = reducer(state0, action);
  console.log("state1", state1);
  return deepFreeze(state1);
}

let store = createStore(root_reducer);
export default store;

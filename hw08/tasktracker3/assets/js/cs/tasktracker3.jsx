import React from 'react';
import ReactDOM from 'react-dom';
import { Provider, connect } from 'react-redux';
import { BrowserRouter as Router, Route } from 'react-router-dom';

import Nav from './nav';
import Tasklist from './tasklist';
import UserList from './user-list';
import TaskForm from './task-form';
import RegisterForm from './register-form';

export default function tasktracker3_init(store){
ReactDOM.render(
  <Provider store={store}>
    <Tasktracker3 />
  </Provider>,
document.getElementById('root')
);
}

let Tasktracker3 = connect((state) => state)((props) => {
return <Router>
<div>
<Nav />

<div class="row">
<Route path="/" exact={true} render={() =>
  <div className="col">
    <TaskForm users={props.users} />
    <Tasklist tasks={props.tasks} />
  </div>
  } />

  <Route path="/users" exact={true} render={() =>
    <div className="col">

      <UserList users={props.users} />
    </div>
    } />

  <Route path="/register" exact={true} render={() =>
      <div className="col">

        <RegisterForm />
      </div>
      } />
  <Route path="/users/:user_id" exact={true} render={({ match }) =>
    <Tasklist tasks={_.filter(props.tasks, (pp) =>{
        if (pp.user){
          return match.params.user_id == pp.user.id
        }

        else{
          return false;
        }
      })} />
  } />
</div>
</div>
</Router>;
});

import store from './store';


class TheServer {

  request_tasks() {
    $.ajax("/api/v1/tasks", {
      method: "get",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      success: (resp) => {
        store.dispatch({
          type: 'TASKS_LIST',
          tasks: resp.data,
        });
      }
    });
  }


  submit_task(data) {
    $.ajax("/api/v1/tasks", {
      method: "post",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      data: JSON.stringify({ task: data }),
      success: (resp) => {
        store.dispatch({
          type: 'ADD_TASK',
          task: resp.data,
        });
      }
    });
  }

  submit_user(data) {
    console.log("submit_user");
    console.log(data);
    $.ajax("/api/v1/users", {
      method: "post",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      data: JSON.stringify({ user: data }),
      success: (resp) => {
        store.dispatch({
          type: 'ADD_USER',
          user: resp.data,
        });
      }

    });

  }

  submit_login(data) {
    $.ajax("/api/v1/token", {
      method: "post",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      data: JSON.stringify(data),
      success: (resp) => {
        store.dispatch({
          type: 'SET_TOKEN',
          token: resp,
        });
      },
      // error: (msg) => {
      //   store.dispatch({
      //     type: 'SET_LOGIN_ERROR',
      //     error: msg,
      //   });
      // }
    });
  }

  submit_logout(data) {

        store.dispatch({
          type: 'LOGOUT_TOKEN',
          token: null,
        });
      // error: (msg) => {
      //   store.dispatch({
      //     type: 'SET_LOGIN_ERROR',
      //     error: msg,
      //   });
  }


  request_users() {
    $.ajax("/api/v1/users", {
      method: "get",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      success: (resp) => {
        store.dispatch({
          type: 'USERS_LIST',
          users: resp.data,
        });

      }
    });
  }

};

export default new TheServer();

defmodule TasktrackerWeb.PageController do
  use TasktrackerWeb, :controller

  alias Tasktracker.Tasklist
  alias Tasktracker.Tasklist.Task

  def index(conn, _params) do
    render conn, "index.html"
  end

  def tasktrack(conn, _params) do
    tasks = Tasklist.list_tasks()
    changeset = Tasklist.change_task(%Task{})
    render conn, "tasktrack.html", tasks: tasks, changeset: changeset
  end

end

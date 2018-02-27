defmodule TasktrackerWeb.PageController do
  use TasktrackerWeb, :controller

  alias Tasktracker.Tasklist
  alias Tasktracker.Tasklist.Task

  def index(conn, _params) do
    render conn, "index.html"
  end

  def tasktrack(conn, _params) do

    tasks = Enum.reverse(Tasktracker.Tasklist.tasktrack_tasks_for(conn.assigns[:current_user]))
    IO.inspect tasks
    changeset = Tasklist.change_task(%Task{})
    render conn, "tasktrack.html", tasks: tasks, changeset: changeset
  end

end

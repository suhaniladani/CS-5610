defmodule TasktrackerWeb.TaskController do
  use TasktrackerWeb, :controller

  alias Tasktracker.Tasklist
  alias Tasktracker.Tasklist.Task

  def index(conn, _params) do
    tasks = Tasklist.list_tasks()
    render(conn, "index.html", tasks: tasks)
  end

  def new(conn, _params) do
    changeset = Tasklist.change_task(%Task{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"task" => task_params}) do
    case Tasklist.create_task(task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task created successfully.")
        |> redirect(to: task_path(conn, :show, task))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    task = Tasklist.get_task!(id)
    render(conn, "show.html", task: task)
  end

  def edit(conn, %{"id" => id}) do
    task = Tasklist.get_task!(id)
    changeset = Tasklist.change_task(task)
    render(conn, "edit.html", task: task, changeset: changeset)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Tasklist.get_task!(id)

    case Tasklist.update_task(task, task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task updated successfully.")
        |> redirect(to: task_path(conn, :show, task))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", task: task, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = Tasklist.get_task!(id)
    {:ok, _task} = Tasklist.delete_task(task)

    conn
    |> put_flash(:info, "Task deleted successfully.")
    |> redirect(to: task_path(conn, :index))
  end
end

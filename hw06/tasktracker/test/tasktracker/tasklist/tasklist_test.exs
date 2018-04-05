defmodule Tasktracker.TasklistTest do
  use Tasktracker.DataCase

  alias Tasktracker.Tasklist

  describe "tasks" do
    alias Tasktracker.Tasklist.Task

    @valid_attrs %{completed: true, description: "some description", time: "120.5", title: "some title"}
    @update_attrs %{completed: false, description: "some updated description", time: "456.7", title: "some updated title"}
    @invalid_attrs %{completed: nil, description: nil, time: nil, title: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tasklist.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Tasklist.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Tasklist.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Tasklist.create_task(@valid_attrs)
      assert task.completed == true
      assert task.description == "some description"
      assert task.time == Decimal.new("120.5")
      assert task.title == "some title"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasklist.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, task} = Tasklist.update_task(task, @update_attrs)
      assert %Task{} = task
      assert task.completed == false
      assert task.description == "some updated description"
      assert task.time == Decimal.new("456.7")
      assert task.title == "some updated title"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasklist.update_task(task, @invalid_attrs)
      assert task == Tasklist.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Tasklist.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Tasklist.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Tasklist.change_task(task)
    end
  end
end

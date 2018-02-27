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

  describe "manages" do
    alias Tasktracker.Tasklist.Manage

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def manage_fixture(attrs \\ %{}) do
      {:ok, manage} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tasklist.create_manage()

      manage
    end

    test "list_manages/0 returns all manages" do
      manage = manage_fixture()
      assert Tasklist.list_manages() == [manage]
    end

    test "get_manage!/1 returns the manage with given id" do
      manage = manage_fixture()
      assert Tasklist.get_manage!(manage.id) == manage
    end

    test "create_manage/1 with valid data creates a manage" do
      assert {:ok, %Manage{} = manage} = Tasklist.create_manage(@valid_attrs)
    end

    test "create_manage/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasklist.create_manage(@invalid_attrs)
    end

    test "update_manage/2 with valid data updates the manage" do
      manage = manage_fixture()
      assert {:ok, manage} = Tasklist.update_manage(manage, @update_attrs)
      assert %Manage{} = manage
    end

    test "update_manage/2 with invalid data returns error changeset" do
      manage = manage_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasklist.update_manage(manage, @invalid_attrs)
      assert manage == Tasklist.get_manage!(manage.id)
    end

    test "delete_manage/1 deletes the manage" do
      manage = manage_fixture()
      assert {:ok, %Manage{}} = Tasklist.delete_manage(manage)
      assert_raise Ecto.NoResultsError, fn -> Tasklist.get_manage!(manage.id) end
    end

    test "change_manage/1 returns a manage changeset" do
      manage = manage_fixture()
      assert %Ecto.Changeset{} = Tasklist.change_manage(manage)
    end
  end

  describe "timeblocks" do
    alias Tasktracker.Tasklist.Timeblock

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def timeblock_fixture(attrs \\ %{}) do
      {:ok, timeblock} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tasklist.create_timeblock()

      timeblock
    end

    test "list_timeblocks/0 returns all timeblocks" do
      timeblock = timeblock_fixture()
      assert Tasklist.list_timeblocks() == [timeblock]
    end

    test "get_timeblock!/1 returns the timeblock with given id" do
      timeblock = timeblock_fixture()
      assert Tasklist.get_timeblock!(timeblock.id) == timeblock
    end

    test "create_timeblock/1 with valid data creates a timeblock" do
      assert {:ok, %Timeblock{} = timeblock} = Tasklist.create_timeblock(@valid_attrs)
    end

    test "create_timeblock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasklist.create_timeblock(@invalid_attrs)
    end

    test "update_timeblock/2 with valid data updates the timeblock" do
      timeblock = timeblock_fixture()
      assert {:ok, timeblock} = Tasklist.update_timeblock(timeblock, @update_attrs)
      assert %Timeblock{} = timeblock
    end

    test "update_timeblock/2 with invalid data returns error changeset" do
      timeblock = timeblock_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasklist.update_timeblock(timeblock, @invalid_attrs)
      assert timeblock == Tasklist.get_timeblock!(timeblock.id)
    end

    test "delete_timeblock/1 deletes the timeblock" do
      timeblock = timeblock_fixture()
      assert {:ok, %Timeblock{}} = Tasklist.delete_timeblock(timeblock)
      assert_raise Ecto.NoResultsError, fn -> Tasklist.get_timeblock!(timeblock.id) end
    end

    test "change_timeblock/1 returns a timeblock changeset" do
      timeblock = timeblock_fixture()
      assert %Ecto.Changeset{} = Tasklist.change_timeblock(timeblock)
    end
  end

  describe "timeblocks" do
    alias Tasktracker.Tasklist.Timeblock

    @valid_attrs %{begin_time: "2010-04-17 14:00:00.000000Z", end_time: "2010-04-17 14:00:00.000000Z"}
    @update_attrs %{begin_time: "2011-05-18 15:01:01.000000Z", end_time: "2011-05-18 15:01:01.000000Z"}
    @invalid_attrs %{begin_time: nil, end_time: nil}

    def timeblock_fixture(attrs \\ %{}) do
      {:ok, timeblock} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tasklist.create_timeblock()

      timeblock
    end

    test "list_timeblocks/0 returns all timeblocks" do
      timeblock = timeblock_fixture()
      assert Tasklist.list_timeblocks() == [timeblock]
    end

    test "get_timeblock!/1 returns the timeblock with given id" do
      timeblock = timeblock_fixture()
      assert Tasklist.get_timeblock!(timeblock.id) == timeblock
    end

    test "create_timeblock/1 with valid data creates a timeblock" do
      assert {:ok, %Timeblock{} = timeblock} = Tasklist.create_timeblock(@valid_attrs)
      assert timeblock.begin_time == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert timeblock.end_time == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
    end

    test "create_timeblock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasklist.create_timeblock(@invalid_attrs)
    end

    test "update_timeblock/2 with valid data updates the timeblock" do
      timeblock = timeblock_fixture()
      assert {:ok, timeblock} = Tasklist.update_timeblock(timeblock, @update_attrs)
      assert %Timeblock{} = timeblock
      assert timeblock.begin_time == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert timeblock.end_time == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
    end

    test "update_timeblock/2 with invalid data returns error changeset" do
      timeblock = timeblock_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasklist.update_timeblock(timeblock, @invalid_attrs)
      assert timeblock == Tasklist.get_timeblock!(timeblock.id)
    end

    test "delete_timeblock/1 deletes the timeblock" do
      timeblock = timeblock_fixture()
      assert {:ok, %Timeblock{}} = Tasklist.delete_timeblock(timeblock)
      assert_raise Ecto.NoResultsError, fn -> Tasklist.get_timeblock!(timeblock.id) end
    end

    test "change_timeblock/1 returns a timeblock changeset" do
      timeblock = timeblock_fixture()
      assert %Ecto.Changeset{} = Tasklist.change_timeblock(timeblock)
    end
  end
end

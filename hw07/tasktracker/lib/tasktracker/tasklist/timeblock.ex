defmodule Tasktracker.Tasklist.Timeblock do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasktracker.Tasklist.Timeblock

  alias Tasktracker.Tasklist.Task

  schema "timeblocks" do
    belongs_to :begintime, Task
    belongs_to :endtime, Task
    belongs_to :usertask, Task

    timestamps()
  end

  @doc false
  def changeset(%Timeblock{} = timeblock, attrs) do
    timeblock
    |> cast(attrs, [:begin_time, :end_time])
    |> validate_required([:begin_time, :end_time])
  end
end

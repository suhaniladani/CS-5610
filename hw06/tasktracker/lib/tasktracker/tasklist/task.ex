defmodule Tasktracker.Tasklist.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasktracker.Tasklist.Task


  schema "tasks" do
    field :completed, :boolean, default: false
    belongs_to :user, Tasktracker.Accounts.User
    field :description, :string
    field :time, :decimal
    field :title, :string


    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:title, :description, :time, :completed, :user_id])
    |> validate_required([:title, :description, :time, :completed, :user_id])
  end
end

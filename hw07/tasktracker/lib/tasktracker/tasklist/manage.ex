defmodule Tasktracker.Tasklist.Manage do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasktracker.Tasklist.Manage

  alias Tasktracker.Accounts.User

  schema "manages" do
    belongs_to :manager, User
    belongs_to :employee, User

    timestamps()
  end

  @doc false
  def changeset(%Manage{} = manage, attrs) do
    manage
    |> cast(attrs, [:manager_id, :employee_id])
    |> validate_required([:manager_id, :employee_id])
  end
end

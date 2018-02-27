defmodule Tasktracker.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasktracker.Accounts.User

  alias Tasktracker.Tasklist.Manage


  schema "users" do
    field :email, :string
    field :name, :string

    has_many :employee_manages, Manage, foreign_key: :employee_id
    has_many :managers, through: [:employee_manages, :manager]
    has_many :manager_manages, Manage, foreign_key: :manager_id

    has_many :employees, through: [:manager_manages, :employee]

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :name])
    |> validate_required([:email, :name])
  end
end

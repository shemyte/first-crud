defmodule SuperStore.Repo do
  use Ecto.Repo,
    otp_app: :super_store,
    adapter: Ecto.Adapters.SQLite3
end

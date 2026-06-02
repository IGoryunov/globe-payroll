defmodule GlobePayroll.Repo do
  use Ecto.Repo,
    otp_app: :globe_payroll,
    adapter: Ecto.Adapters.Postgres
end

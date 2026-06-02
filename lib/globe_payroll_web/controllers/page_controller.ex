defmodule GlobePayrollWeb.PageController do
  use GlobePayrollWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end

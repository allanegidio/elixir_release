defmodule ElixirReleaseWeb.PageController do
  use ElixirReleaseWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    IO.inspect("Uma release d")
    render(conn, :home, layout: false)
  end
end


defmodule IncrementServiceWeb do
  def controller do
    quote do
      use Phoenix.Controller,
        namespace: IncrementServiceWeb

      import Plug.Conn
    end
  end

  def router do
    quote do
      use Phoenix.Router
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end

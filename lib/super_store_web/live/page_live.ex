defmodule SuperStoreWeb.PageLive do
  use SuperStoreWeb, :live_view
  import SuperStoreWeb.CoreComponents
  alias SuperStore.Catalog.Product

  def mount(_params, _session, socket) do
    form =
    Product.changeset(%Product{})
    |> to_form()

    {:ok, assign(socket, form: form)}
  end

  def handle_event("validate_product", %{"product" => product_params}, socket) do
    form =
    Product.changeset(%Product{}, product_params)
    |> Map.put(:action, :validate)
    |> to_form()

    {:noreply, assign(socket, form: form)}
  end

  def handle_event("create_product", %{"product" => product_params}, socket) do
    IO.inspect({"Form Submitted!!", product_params})
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="bg-gray-100">
      <.form
        for={@form}
        phx-change="validate_product"
        phx-submit="create_product"
        class="flex flex-col max-w-96 mx-auto bg-gray-100 p-24"
      >
        <h1>Create Product</h1>
        <.input
          field={@form[:name]}
          placeholder="Name"
        />

        <.input
          field={@form[:description]}
          placeholder="Description"
        />

        <.button class="submit">Send</.button>
      </.form>
    </div>
    """
  end
end

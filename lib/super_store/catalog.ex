defmodule SuperStore.Catalog do
  alias SuperStore.Repo
  alias SuperStore.Catalog.Product

  def create_product(attrs) do
    Product.changeset(%Product{}, attrs)
    |> Repo.insert()
  end

  def list_products() do
    Product
    |> Repo.all()
  end

  def get_product!(id), do: Repo.get!(Product, id)

  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end
end

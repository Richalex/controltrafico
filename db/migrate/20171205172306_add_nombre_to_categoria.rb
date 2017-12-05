class AddNombreToCategoria < ActiveRecord::Migration[5.1]
  def change
    add_column :categoria_buses, :nombre, :string
  end
end

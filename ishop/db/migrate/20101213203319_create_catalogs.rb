class CreateCatalogs < ActiveRecord::Migration
  def self.up
    create_table :catalogs do |t|
      t.column :name, :text, :null => false
      t.column :about, :text
      
      t.timestamps
    end
    Catalog.create(:name => "Каталог продуктов",
:about => "В этом каталоге лежат только самые свежие продукты"
)
    Catalog.create(:name => "Каталог супер-продуктов",
:about => "В этом каталоге лежат только супер-продукты"
)
    Catalog.create(:name => "Каталог левых продуктов",
:about => "В этом каталоге лежат только не самые свежие продукты"
)
  end

  def self.down
    drop_table :catalogs
  end
end

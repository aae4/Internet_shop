class Good < ActiveRecord::Base
	  validates_presence_of :name,
    :message => 'Должно быть название товара'
  validates_numericality_of :size_x, :allow_nil => false, 
    :less_than => 10000, :greater_than => 0,
    :message => 'Ширина должна быть положительным числом'
  validates_numericality_of :size_y, :allow_nil => false, 
    :less_than => 10000, :greater_than => 0,
    :message => 'Длина должна быть положительным числом'
  validates_numericality_of :size_z, :allow_nil => false, 
    :less_than => 10000, :greater_than => 0,
    :message => 'Высота должна быть положительным числом'
  validates_numericality_of :weight, :allow_nil => false, 
    :less_than => 10000, :greater_than => 0,
    :message => 'Вес должен быть положительным числом'
   validates_numericality_of :price, :allow_nil => false, 
    :less_than => 10000, :greater_than => 0,
    :message => 'Цена должна быть положительным числом'
   validates_numericality_of :quant, :allow_nil => false, 
    :less_than => 10000, :greater_than => -1,
    :message => 'Количество должна быть положительным числом'
   validates_presence_of :about, :allow_nil => false, 
    :message => 'Поставщик должен быть указан'
   validates_presence_of :provider, :allow_nil => false, 
    :message => 'Поставщик должен быть указан'
    
    belongs_to :catalog
    has_many :buys
end

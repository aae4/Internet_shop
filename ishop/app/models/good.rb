class Good < ActiveRecord::Base
  validates_presence_of :name,
    :message => 'Должно быть название товара'
  validates_numericality_of :size_x, :allow_nil => true, 
    :less_than => 10000, :greater_than => 0,
    :message => 'Ширина должна быть положительным числом'
  validates_numericality_of :size_y, :allow_nil => true, 
    :less_than => 10000, :greater_than => 0,
    :message => 'Длина должна быть положительным числом'
  validates_numericality_of :size_z, :allow_nil => true, 
    :less_than => 10000, :greater_than => 0,
    :message => 'Высота должна быть положительным числом'
  validates_numericality_of :weight, :allow_nil => true, 
    :less_than => 10000, :greater_than => 0,
    :message => 'Вес должен быть положительным числом'
   validates_numericality_of :price, :allow_nil => true, 
    :less_than => 10000, :greater_than => 0,
    :message => 'Цена должна быть положительным числом'
end

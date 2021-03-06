class Catalog < ActiveRecord::Base
	validates_presence_of :name,
	:message => 'Должно быть указано название каталога'	
	validates_presence_of :about,
        :message => 'Должно быть указано описание'
	
	validates_associated :goods
	has_many :goods
	
end

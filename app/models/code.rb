class Code < ActiveRecord::Base
	 validates :titulo, uniqueness: true
end

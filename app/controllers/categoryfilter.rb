class Categoryfilter
	include ActiveModel::Validations
	attr_accessor :category_id, :to_key, :categoryfilter_path

	validates_each :category_id do |record, attr, value|
    record.errors.add attr, 'starts with z.' if value.to_s[0] == ?z
   end 

end
module UsersHelper
	def flash_class_name(key)
		case key.to_s
		when 'sucess'
			"alert-sucess"
		when 'error'
			"alert-danger"
		else
			"alert-warning"
		end
	end 
end

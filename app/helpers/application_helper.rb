module ApplicationHelper

	def full_title(name='')
		if name == ''
			return 'Microblog'
	    else
	    	return name + ' | MB'
	    end
	end

end

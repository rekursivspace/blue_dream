class ApplicationController < ActionController::API
	def gen_pagination(payload:, page:)
		total_pages = payload.total_pages
		if page.to_i == 0
			current_page = 1
		else
			current_page = page.to_i
		end

		{
			total_pages: total_pages,
			current_page: current_page,
		}
	end
end

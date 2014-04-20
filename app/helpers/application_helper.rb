module ApplicationHelper
	def full_title(page_title)
		base_title = "PriceComparison"
		home_title = "Prices"
		if page_title.empty?
			home_title
		else
			"#{base_title} | #{page_title}"
		end
	end
end

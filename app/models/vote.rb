class Vote < ActiveRecord::Base

	validates :checkboxes, length: { minimum: 2 } # stored as a CSV string
	validates :support,    length: { minimum: 2 } # stored as "Yes" or "No"
	validates :story,      length: { maximum: 300 }

	def segment_values
		["Yes", "No"]
	end

	def checkbox_values
		[
			"Lazy",
			"Burnout",
			"Gardening",
			"Drug",
			"Every Day",
			"Taco Bell",
			"Cliff Harris",
			"Anxiety",
			"Drug Test",
			"Medicinal",
			"Calming"
		]	
	end

end
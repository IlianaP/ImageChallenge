class Image 
	attr_accessor :rows_combined
	def initialize (rows_combined) 
		@rows_combined = rows_combined 
	end 

	def output_image 
		@rows_combined.each do |row| 
			puts row.join 
		end 
	end 

	def blur 
		height_of_array = @rows_combined.length 
		width_of_array = @rows_combined[0].length 

		newarray = [] 

		@rows_combined.each_with_index do |row, r| 
			row.each_with_index do |value, v| 
				if value == 1 
					newarray << [v,r] 
				end 
			end 
		end 
# array =[[1,2],[3,4]] 
# [1,2]<-
#  x, y= [1,2] 
		newarray.each do |position| 
			v, r = position 
			@rows_combined[r][v-1] = 1 if v-1 >= 0
			@rows_combined[r][v+1] = 1 if v+1 < width_of_array
			@rows_combined[r-1][v] = 1 if r-1 >=0 
			@rows_combined[r+1][v] = 1 if r+1 < height_of_array 

		end 

		@rows_combined.each do |row| 
			puts row.join 
		end 
	end 
end


image = Image.new(
	[ [1, 0, 0, 0], 
	  [0, 0, 0, 0], 
	  [0, 0, 0, 1], 
	  [0, 0, 0, 0] ])

image.blur




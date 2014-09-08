require 'csv'
csv = Array.new
name = Array.new
marks = Array.new
color = Array.new
seperated = Array.new
colorScore = [0,0,0]
favoriteColor = ""
badColor = ""
maxScore = 0
minScore = 100
mean = 0
i = 1
CSV.foreach('data.csv') do |row|
	csv << row
end
while i<csv.length
	name << csv[i][0].split(" ")
	marks << csv[i][1].to_f
	color << csv[i][2]
	i += 1
end

marks.each do |x|
	if x>maxScore
		maxScore = x
	end
	if x<minScore
		minScore = x
	end
	mean += x
end
mean = mean/marks.length

color.each do |x|
	if x == "Blue"
		colorScore[0] += 1
	end
	if x == "Yellow"
		colorScore[1] += 1
	end
	if x == "Red"
		colorScore[2] += 1
	end
end

if (colorScore[0]>colorScore[1]) && (colorScore[0]>colorScore[2])
	favoriteColor = "Blue"
elsif (colorScore[1]>colorScore[0]) && (colorScore[1]>colorScore[2])
	favoriteColor = "Yellow"
else
	favoriteColor = "Red"
end

if (colorScore[0]<colorScore[1]) && (colorScore[0]<colorScore[2])
	badColor = "Blue"
elsif (colorScore[1]<colorScore[0]) && (colorScore[1]<colorScore[2])
	badColor = "Yellow"
else
	badColor = "Red"
end

i=0
while i<name.length
	name[i][0].downcase!
	name[i][0].reverse!
	name[i][0].capitalize!
	name[i][0].reverse!
	name[i][name[i].length-1].reverse!
	name[i][name[i].length-1].capitalize!
	name[i][name[i].length-1].reverse!
	i += 1
end

puts "The highest score is #{maxScore}"
puts "The lowest score is #{minScore}"
puts "Mean of the class is #{mean}"
puts "capitalized name: "
name.each do |x|
	puts x.join(" ")
end
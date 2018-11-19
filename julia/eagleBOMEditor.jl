using CSV

# Input ARGS via terminal
# run: julia eagleBOMEditor.jl hermanBOM.csv
# where hermanBOM.csv would be the ARGS variable value
# NOTE: without the for loop ARGS cannot be referenced for some reason

for arg in ARGS
	#println(arg)
	file = arg
	csvFileLocation = pwd() * "/" * file
	#println(csvFileLocation)
	tempCSV = CSV.read(csvFileLocation, delim=";")
	
	println("Read CSV")
	println(tempCSV)
	
	delete!(tempCSV, :Device)
	delete!(tempCSV, :Package)
	delete!(tempCSV, :Description)
	delete!(tempCSV, :MANUF)
	delete!(tempCSV, :TOLERANCE)
	delete!(tempCSV, :TYPE)
	delete!(tempCSV, :VALUE)
	delete!(tempCSV, :VOLTAGE)

	# Additional attributes to remove
	#delete!(tempCSV, :MAX_AC)
	#delete!(tempCSV, :MAX_DC)
	delete(tempCSV, :COLOR)
	delete!(tempCSV, :POWER)
	delete!(tempCSV, :INTERNALCLK)
	#delete!(tempCSV, :SPICEPREFIX)
	#delete!(tempCSV, :TCR)
	#delete!(tempCSV, :CURRENT)
	
	println("	")
	println("Output CSV")
	println(tempCSV)
	
	CSV.write(csvFileLocation, tempCSV)
end
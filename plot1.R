# Set File
filePath <- "C:/DOST_Caraga_Coursera/Specialization/Data Science/Course4/Week1/household_power_consumption.txt"

# Set Data
hpc_data <- read.delim(file=filePath, header=TRUE, sep=";", dec = ".")

hpc_data <- subset(hpc_data, 
	as.Date(Date,"%d/%m/%Y") >= as.Date("1/2/2007", "%d/%m/%Y") &
	as.Date(Date,"%d/%m/%Y") <= as.Date("2/2/2007", "%d/%m/%Y"),)

# Prepare Data
gap <- table(hpc_data$Global_active_power)

# Bar Plotting
par(mfrow=c(1,1))

barplot(
	height=gap,
	space=0,
	main="Global Active Power", 
	ylab="Frequency", 
	xlab="Global Active Power (kilowatts)", 
	col="red",
	xlim=c(0,6),
	xpd=FALSE,
	width=0.1,
	xaxt='n')

axis(side=1,at=c(0, 2, 4, 6))

#Save file
dev.print(png, file = "C:/DOST_Caraga_Coursera/Specialization/Data Science/Course4/repos/ExData_Plotting1/rdata/plot1.png", width = 1024, height = 768)

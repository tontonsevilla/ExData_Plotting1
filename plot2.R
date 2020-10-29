# Set File
filePath <- "C:/DOST_Caraga_Coursera/Specialization/Data Science/Course4/Week1/household_power_consumption.txt"

# Set Data
hpc_data <- read.delim(file=filePath, header=TRUE, sep=";", dec = ".")

hpc_data <- subset(hpc_data, 
	as.Date(Date,"%d/%m/%Y") >= as.Date("1/2/2007", "%d/%m/%Y") &
	as.Date(Date,"%d/%m/%Y") <= as.Date("2/2/2007", "%d/%m/%Y"),)

# head(hpc_data)

# Plotting
par(mfrow=c(1,1))

with(hpc_data, 
	plot(Global_active_power ~ as.POSIXct(paste(as.Date(hpc_data$Date,"%d/%m/%Y"), hpc_data$Time), format="%Y-%m-%d %H:%M:%S"),
		xlim=c(min(as.POSIXct(paste(as.Date(hpc_data$Date,"%d/%m/%Y"), hpc_data$Time), format="%Y-%m-%d %H:%M:%S")),
			 max(as.POSIXct(paste(as.Date(hpc_data$Date,"%d/%m/%Y"), hpc_data$Time), format="%Y-%m-%d %H:%M:%S"))),
		type="l",
		xlab="",
		ylab="Global Active Power (kilowatts)"
	)
)

#Save file
dev.print(png, file = "C:/DOST_Caraga_Coursera/Specialization/Data Science/Course4/repos/ExData_Plotting1/rdata/plot2.png", width = 1024, height = 768)


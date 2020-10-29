# Set File
filePath <- "C:/DOST_Caraga_Coursera/Specialization/Data Science/Course4/Week1/household_power_consumption.txt"

# Set Data
hpc_data <- read.delim(file=filePath, header=TRUE, sep=";", dec = ".")

hpc_data <- subset(hpc_data, 
	as.Date(Date,"%d/%m/%Y") >= as.Date("1/2/2007", "%d/%m/%Y") &
	as.Date(Date,"%d/%m/%Y") <= as.Date("2/2/2007", "%d/%m/%Y"),)

head(hpc_data)

# Plotting
par(mfrow=c(1,1))

# Sub_metering_1
with(hpc_data, 
	plot(Sub_metering_1 ~ as.POSIXct(paste(as.Date(hpc_data$Date,"%d/%m/%Y"), hpc_data$Time), format="%Y-%m-%d %H:%M:%S"),
		xlim=c(min(as.POSIXct(paste(as.Date(hpc_data$Date,"%d/%m/%Y"), hpc_data$Time), format="%Y-%m-%d %H:%M:%S")),
			 max(as.POSIXct(paste(as.Date(hpc_data$Date,"%d/%m/%Y"), hpc_data$Time), format="%Y-%m-%d %H:%M:%S"))),
		type="l",
		xlab="",
		ylab="Energy sub metering"
	)
)

# Sub_metering_2
with(hpc_data, lines(Sub_metering_2 ~ as.POSIXct(paste(as.Date(hpc_data$Date,"%d/%m/%Y"), hpc_data$Time), format="%Y-%m-%d %H:%M:%S"),
	col="red"))

# Sub_metering_3
with(hpc_data, lines(Sub_metering_3 ~ as.POSIXct(paste(as.Date(hpc_data$Date,"%d/%m/%Y"), hpc_data$Time), format="%Y-%m-%d %H:%M:%S"),
	col="blue"))

# Add a legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)

#Save file
dev.print(png, file = "C:/DOST_Caraga_Coursera/Specialization/Data Science/Course4/repos/ExData_Plotting1/rdata/plot3.png", width = 1024, height = 768)


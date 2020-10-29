# Set File
filePath <- "C:/DOST_Caraga_Coursera/Specialization/Data Science/Course4/Week1/household_power_consumption.txt"

# Set Data
hpc_data <- read.delim(file=filePath, header=TRUE, sep=";", dec = ".")

hpc_data <- subset(hpc_data, 
	as.Date(Date,"%d/%m/%Y") >= as.Date("1/2/2007", "%d/%m/%Y") &
	as.Date(Date,"%d/%m/%Y") <= as.Date("2/2/2007", "%d/%m/%Y"),)

head(hpc_data)

# Plotting

# Arrange for 2 rows and 2 columns
par(mfrow=c(2,2))

# Row 1 Column 1 - Global Active Power
with(hpc_data, 
	plot(Global_active_power ~ as.POSIXct(paste(as.Date(hpc_data$Date,"%d/%m/%Y"), hpc_data$Time), format="%Y-%m-%d %H:%M:%S"),
		xlim=c(min(as.POSIXct(paste(as.Date(hpc_data$Date,"%d/%m/%Y"), hpc_data$Time), format="%Y-%m-%d %H:%M:%S")),
			 max(as.POSIXct(paste(as.Date(hpc_data$Date,"%d/%m/%Y"), hpc_data$Time), format="%Y-%m-%d %H:%M:%S"))),
		type="l",
		xlab="",
		ylab="Global Active Power"
	)
)

# Row 1 Column 2 - Voltage
with(hpc_data, 
	plot(Voltage ~ as.POSIXct(paste(as.Date(hpc_data$Date,"%d/%m/%Y"), hpc_data$Time), format="%Y-%m-%d %H:%M:%S"),
		xlim=c(min(as.POSIXct(paste(as.Date(hpc_data$Date,"%d/%m/%Y"), hpc_data$Time), format="%Y-%m-%d %H:%M:%S")),
			 max(as.POSIXct(paste(as.Date(hpc_data$Date,"%d/%m/%Y"), hpc_data$Time), format="%Y-%m-%d %H:%M:%S"))),
		type="l",
		xlab="datetime",
		ylab="Voltage"
	)
)

# Row 2 Column 1 - Energy sub metering
with(hpc_data, 
	plot(Sub_metering_1 ~ as.POSIXct(paste(as.Date(hpc_data$Date,"%d/%m/%Y"), hpc_data$Time), format="%Y-%m-%d %H:%M:%S"),
		xlim=c(min(as.POSIXct(paste(as.Date(hpc_data$Date,"%d/%m/%Y"), hpc_data$Time), format="%Y-%m-%d %H:%M:%S")),
			 max(as.POSIXct(paste(as.Date(hpc_data$Date,"%d/%m/%Y"), hpc_data$Time), format="%Y-%m-%d %H:%M:%S"))),
		type="l",
		xlab="",
		ylab="Energy sub metering"
	)
)

with(hpc_data, lines(Sub_metering_2 ~ as.POSIXct(paste(as.Date(hpc_data$Date,"%d/%m/%Y"), hpc_data$Time), format="%Y-%m-%d %H:%M:%S"),
	col="red"))

with(hpc_data, lines(Sub_metering_3 ~ as.POSIXct(paste(as.Date(hpc_data$Date,"%d/%m/%Y"), hpc_data$Time), format="%Y-%m-%d %H:%M:%S"),
	col="blue"))

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, bty="n")

# Row 2 Column 2 - Global Reactive Power
with(hpc_data, 
	plot(Global_reactive_power ~ as.POSIXct(paste(as.Date(hpc_data$Date,"%d/%m/%Y"), hpc_data$Time), format="%Y-%m-%d %H:%M:%S"),
		xlim=c(min(as.POSIXct(paste(as.Date(hpc_data$Date,"%d/%m/%Y"), hpc_data$Time), format="%Y-%m-%d %H:%M:%S")),
			 max(as.POSIXct(paste(as.Date(hpc_data$Date,"%d/%m/%Y"), hpc_data$Time), format="%Y-%m-%d %H:%M:%S"))),
		type="l",
		xlab="datetime"
	)
)

#Save file
dev.print(png, file = "C:/DOST_Caraga_Coursera/Specialization/Data Science/Course4/repos/ExData_Plotting1/rdata/plot4.png", width = 1024, height = 768)


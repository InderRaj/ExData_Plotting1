download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',destfile='household_power_consumption.zip',method="curl")
unzip('household_power_consumption.zip')

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.zip"))
unlink(temp)

data <- read.table(data, header=TRUE, sep=";",
                   stringsAsFactors=FALSE, na.strings=c("?"))

# Below we only need data from two days
sdata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

png("plot1.png")
hist(sdata$Global_active_power, 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     col = "red")
dev.off()
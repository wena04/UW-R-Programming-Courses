# SOC 225: Lab 8
# Anthony Wen
# 07/17/2024
# 5 TASKS

# Welcome to Lab 8! Today, we will dive into the basics of time series data analysis. By the end of this lab, you should be able to plot time series data, understand trends and seasonality, and use the ts() and decompose() functions in R.

# Lab Goals
# -Plotting time series data
# -Understanding trends and seasonality
# -Using ts() and decompose() functions

# BASICS OF TIME SERIES DATA

# Time series data is a sequence of data points recorded at specific time intervals. This type of data is often used to track changes over time, such as stock prices, weather data, and economic indicators.

# Let's start with a simple example of time series data. We will use the built-in AirPassengers dataset in R, which records the monthly totals of international airline passengers from 1949 to 1960.

# We will first convert the AirPassengers data to a time series object using the ts() function and then plot it.
# We'll need to load ggplot2 to gather this dataset.
library(ggplot2)
data("AirPassengers")

# Then we can use ts() to convert it to a time-series object. Type ?ts() in the console to see what you need to generate these kinds of objects.
ap_ts <- ts(AirPassengers, start = c(1949, 1), frequency = 12)

# We can then plot the resulting object, take a look!
plot(ap_ts, main = "Monthly International Airline Passengers", ylab = "Passengers", xlab = "Year")

# There are some useful functions that make time series objects easier to deal with than working with conventional dataframes. Whether or not you use them is up to you!
?nottem
# TASK 1 ***********************************************************************
# Using the above example as a guide, load the nottem dataset (another built-in dataset recording average monthly temperatures at Nottingham Castle), convert it to a time series object and plot it.
data("nottem")
no_ts <- ts(nottem, start = c(1920, 1), frequency = 12)
plot(no_ts, main = "Average Monthly Temperature Nottingham Castle", ylab = "Temperature", xlab = "Year")

# TRENDS AND SEASONALITY

# Time series data often contains underlying patterns, such as trends and seasonality. A trend is a long-term increase or decrease in the data, while seasonality refers to repeating patterns or cycles.

# The decompose() function can be used to separate a time series into its components: trend, seasonal, and random. Type ?decompose() for more information.
ap_decomp <- decompose(ap_ts)

# And then we can plot this object as well.
plot(ap_decomp)

# The resulting graph shows the observed values on top, the overall trend of values in the second row, the seasonal peaks and valleys beneath that, and then the random 'other' in the last row.

# TASK 2 ***********************************************************************
# What time(s) of the year did airline traffic peak? What was the overall trend?
# the overall trend is increasing, the traffic was at its peak around 1960


# TASK 3 ***********************************************************************
# Decompose the nottem time series and plot the decomposed components. What patterns do you see?
no_decomp <- decompose(no_ts)
plot(no_decomp)
#the trend is not like a linear looking line like the plane ones, it's relatively shaky, but overall, the temperature/trend is increasing. Looking at the seasonal part, the weather pattern is cyclical pattern, the temperature is the same.

# MAKING YOUR OWN TIME SERIES DATA

# The ts() function is used to create time series objects in R. It requires the data, start time, and frequency of observations.

# Here we'll create a simple time series object
example_data <- c(5, 8, 7, 6, 10, 12, 15, 14, 18, 20, 22, 25)
example_ts <- ts(example_data, start = c(2020, 1), frequency = 12)

# And plot it
plot(example_ts, main = "Example Time Series", ylab = "Values", xlab = "Time")

# TASK 4 ***********************************************************************
# Create a time series object using the following data: 3, 5, 2, 8, 7, 6, 9, 10, 12, 11, 15, 16, 18, 20, 22, 25, 28, 30, 33, 35, 38, 40, 43, 45, 48, 50, 53, 55, 58, 60, 63, 65, 68, 70, 73, 75, 78, 80, 83, 85, 88, 90, 93, 95, 98, 100, 103, 105, 108, 110, 113, 115, 118, 120, 123, 125, 128, 130, 133, 135.  Assume the data starts from January 1997 and has a biannual frequency. Plot the time series.
noe_data <- c(3, 5, 2, 8, 7, 6, 9, 10, 12, 11, 15, 16, 18, 20, 22, 25, 28, 30, 33, 35, 38, 40, 43, 45, 48, 50, 53, 55, 58, 60, 63, 65, 68, 70, 73, 75, 78, 80, 83, 85, 88, 90, 93, 95, 98, 100, 103, 105, 108, 110, 113, 115, 118, 120, 123, 125, 128, 130, 133, 135)
noe_ts <- ts(noe_data, start = c(1997, 1), frequency = 6)
plot(noe_ts, main = "Own Time Series", ylab = "Values", xlab = "Time")

# TASK 5 ***********************************************************************
# Decompose the time series object you created in TASK 4 and plot the decomposed components. Note any patterns that you see
noe_decomp <- decompose(noe_ts)
plot(noe_decomp)
# the trend is increasing linearl just like the observed values too. The seasonal values also have a similar repeating up down up down pattern with a period of the same pattern around every year or so. The randomness is relatively flat compared to the other ones, and is at the peak in the begining few years, but gets more steady towards the end.

# Conclusion
# In this lab, we explored the basics of time series data analysis. We learned how to create time series objects, plot them, and decompose them into their components. These skills are fundamental for analyzing and interpreting time series data in various domains.

# Be sure to SAVE THIS FILE and upload it into Canvas when you have completed all tasks. Please submit as a .R file.
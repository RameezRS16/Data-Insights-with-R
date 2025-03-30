# Load Required Libraries
library(taskscheduleR)

# Define R Script Path
script_path <- normalizePath("monitoring.R")

# Schedule the Task to Run Every Day at 12 PM
taskscheduler_create(
  taskname = "Daily_Model_Monitoring",
  rscript = script_path,
  schedule = "DAILY",
  starttime = "12:00",
  startdate = format(Sys.Date(), "%d/%m/%Y")
)

print("Automation setup completed successfully!")

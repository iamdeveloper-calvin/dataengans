import schedule
import time

import etl_pipeline as etl

etl_time = "01:00"

def job_etl():
    etl.start()

schedule.every().day.at(etl_time).do(job_etl)

# For testing 
# schedule.every().minute.at(":05").do(job_etl)

while True:
    schedule.run_pending()
    time.sleep(1)
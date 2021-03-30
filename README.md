# dataengans

## Section 1: Data Pipelines

Solution implemented in python. 
It consists of 3 files. 
- etl_pipeline.py 
- etl_schedule.py
- run_schedule.sh

The job can be scheduled using the run_schedule.sh script which will run etl_schedule.py
- It is scheduled to run everyday at 01:00

The main login is found int etl_pipeline.py
The folders are created to simulate the solution. 
- input 
This folder contains the incoming payload to be extracted, transformed and loaded
- output
This folder contains the processed payload for further downstream use
- log
Thos folder contians the log for the etl process
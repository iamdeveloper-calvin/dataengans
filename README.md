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

## Section 2: Databases

Provided 4 files for design and implementation
1. ERD.PNG
    - This is the Entity Relationship Diagram for the tables
2. ddl_script.sql
    - Create the tables as shown in ERD
3. dml_sample_data.sql
    - sample date for the tables as insert statement
4. dml_sample_query.sql
    - provide answers to the sql task 1 & 2

Provided 2 files for Dockerized Postgres
1. docker-compose.yml
2. database.env

Command to start up database with docker
>> docker-compose up

Command to get CONTAINER ID
>> docker container ls

Command to connect to Dockerized Postgres
>> docker exec -it <CONTAINER ID> psql -U postgres dataengans

Once in psql

Command to show databases
>> dataengans=# \l
Issue this command if you are not connected to the dataengans database
>> dataengans=# \c dataengans;
Show tables in dataengans
>> dataengans=# \dt

Copy sql statement from the 3 scripts and run them. Make sure each statement ends with a ;

## Section 3: System Design

## Section 4: Charts and API

## Section 5: Machine Learning
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

Proposed architecture submitted. 
1. dataengans_section1.pptx
2. dataengans_section1.pdf

Assuming the company is having existing Kafka Application and Cluster running on AWS. 
The new image uploading web application is proposed to host on AWS as well. 
The images uploaded to flow to Amazon S3, ready to be picked up by existing Image processing application for processing and produce Kafka streams into the Kafka Cluster. 
The images can be kept in Amazon S3 for unless 7 days. Depending on the archival policy, Awmazon Glacier can be considered for moving og images from S3 to Glacier.
As for business intelligence requirement, the company can adopt solutions like Tableau, Amazon Quicksight, Qlikview to connect to the Kafka Cluster using connectors.
For specialized requirements, bespoke dashboard can also be built using programming languages like Java, Python, etc.
  

## Section 4: Charts and API

Prototype solution is implemented using Flask and Chart.js
https://www.chartjs.org/

The data are fetched from https://api.covid19api.com on application first load

Because the daily data point are too many for display, therefore I took the approach to present only 1 number, final accumulated cases for the month.

2 charts are presented, a Bar Chart and a Line Chart

Command to  start the application 
>> docker-compose up --build

You will see the following output on your terminal

Building dataengdashboard
[+] Building 0.2s (9/9) FINISHED                                                                                                                                                     
 => [internal] load build definition from Dockerfile                                                                                                                            0.0s
 => => transferring dockerfile: 36B                                                                                                                                             0.0s
 => [internal] load .dockerignore                                                                                                                                               0.0s
 => => transferring context: 2B                                                                                                                                                 0.0s
 => [internal] load metadata for docker.io/library/python:3.8                                                                                                                   0.0s
 => [1/4] FROM docker.io/library/python:3.8                                                                                                                                     0.0s
 => [internal] load build context                                                                                                                                               0.0s
 => => transferring context: 368B                                                                                                                                               0.0s
 => CACHED [2/4] WORKDIR /app                                                                                                                                                   0.0s
 => CACHED [3/4] COPY * /app/                                                                                                                                                   0.0s
 => CACHED [4/4] RUN pip3 install -r requirements.txt                                                                                                                           0.0s
 => exporting to image                                                                                                                                                          0.0s
 => => exporting layers                                                                                                                                                         0.0s
 => => writing image sha256:ff7c25a3d4055806de3f45d73bec60dae981777b84327a34d2fa1247e827c05d                                                                                    0.0s
 => => naming to docker.io/library/section3_dataengdashboard                                                                                                                    0.0s
Successfully built ff7c25a3d4055806de3f45d73bec60dae981777b84327a34d2fa1247e827c05d
Starting section3_dataengdashboard_1 ... done
Attaching to section3_dataengdashboard_1
dataengdashboard_1  |  * Serving Flask app "./app.py" (lazy loading)
dataengdashboard_1  |  * Environment: production
dataengdashboard_1  |    WARNING: This is a development server. Do not use it in a production deployment.
dataengdashboard_1  |    Use a production WSGI server instead.
dataengdashboard_1  |  * Debug mode: on
dataengdashboard_1  |  * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
dataengdashboard_1  |  * Restarting with stat
dataengdashboard_1  |  * Debugger is active!
dataengdashboard_1  |  * Debugger PIN: 284-474-476

Open a browser with the url to http://127.0.0.1:5000

## Section 5: Machine Learning

Using the dataset from https://archive.ics.uci.edu/ml/datasets/Car+Evaluation
The dataset is converted using convert.py to car_converted.csv

All the data are placed in folder data

common.py contains the mapping used for the conversion of dataset to number

ml.py is the main application containing the logic to the ML model. 

The model is a Decision Tree

For the solution to work, please read the readme.txt for addition packages to be installed.
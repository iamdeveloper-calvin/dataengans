import logging
import datetime
from pathlib import Path

import csv 

def init():
    logging.basicConfig(filename="log/" + datetime.datetime.now().strftime("%Y%m%d") + "_ETL.log", encoding="utf-8", format='%(asctime)s %(levelname)s %(message)s', level=logging.INFO)

def etl():
    file_ext   = "csv"
    # List of files to process from the folder "input"
    file_names = ["dataset1","dataset2"]
    for file_name in file_names: 
        logging.info("######################################");
        logging.info("Extract ... " + file_name + file_ext)
        csv_file_name = file_name + "." + file_ext
        file2open = Path("input")/csv_file_name
        with open(file2open, "r") as csv_file:
            lines = csv.reader(csv_file, delimiter=",")
            
            datasets_dict = [] 

            line_count    = 0
            invalid_count = 0 
            valid_count   = 0

            for line in lines:
                if line_count > 0: 
                    dataset_dict = {}            
                    if line[0] is None or not len(line[0]) > 0:
                        # Record without a name is not added to the dictionary
                        invalid_count += 1
                        logging.warning(line)
                    else:
                        valid_count += 1
                        # Recoding the original data from the csv for furthe processing
                        dataset_dict["rawname"]  = line[0]
                        dataset_dict["rawprice"] = line[1]
                        # Perform necessary tranformation to the original data
                        transform(dataset_dict)
                        logging.info(str(dataset_dict))
                        datasets_dict.append(dataset_dict)
                line_count += 1

            logging.info("Total Count   : " + str(line_count-1))
            logging.info("Invalid Count : " + str(invalid_count))
            logging.info("Valid Count   : " + str(valid_count))
            logging.info("######################################\n");

        
        load(file_name, file_ext, datasets_dict)


def transform(dataset_dict):
    # Tokenize the original name for processing
    rawnames = dataset_dict["rawname"].split(" ")
    # This list of salutation are removed from the names. 
    name_filters = {"Mr.":"Mr.","Ms.":"Ms.","DDS":"DDS","MD":"MD","DVM":"DVM","Dr.":"Dr.","Mrs.":"Mrs.","PhD":"PhD","Miss":"Miss"}

    # Removing salutation from the name and reconstructing the full name without the salutation
    full_name = ""
    for rawname in rawnames: 
        try: 
            x = name_filters[rawname]
        except: 
            if len(full_name)>0:
                full_name = full_name + " " + rawname
            else:
                full_name = full_name + rawname

    # Extracting the firstname and lastname from the reconstructed fullname with the salutation
    fullname = full_name.split(" ")
    if len(fullname) == 2:
        dataset_dict["first_name"] = fullname[0]
        dataset_dict["last_name"]  = fullname[1]
    if len(fullname) == 3:
        # Names with 3 tokens generally contains III, Jr., II etc which fo0rms the firstname
        dataset_dict["first_name"]  = fullname[0] + " " + fullname[2]
        dataset_dict["last_name"]   = fullname[1]
    
    # Casting the string price to float removes the prepended zeros from the price
    price_float = float(dataset_dict["rawprice"]) 
    dataset_dict["price"] = price_float
    
    if price_float > 100:
        dataset_dict["above_100"] = "true"
    else:
        dataset_dict["above_100"] = "false"

def load(file_name, file_ext, datasets_dict):
    logging.info("######################################\n");
    csv_file_name = datetime.datetime.now().strftime("%Y%m%d")+"_"+file_name + "_processed." + file_ext
    file_to_open = Path("output")/csv_file_name
    logging.info("Load ...." + csv_file_name)
    csv_columns = ["first_name","last_name","price","above_100"]
    with open(file_to_open, 'w') as csv_file:
        writer = csv.DictWriter(csv_file, fieldnames=csv_columns)
        writer.writeheader()
        for dataset_dict in datasets_dict:
            # Removing the original name and price before wrirting the processed data 
            dataset_dict.pop("rawname",None)
            dataset_dict.pop("rawprice",None)
            writer.writerow(dataset_dict)


def start():
    init()
    etl()

if __name__ == '__main__':
    start()
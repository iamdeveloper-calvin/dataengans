import csv 
import logging
import datetime
from pathlib import Path
import common

def init():
    logging.basicConfig(filename="log/" + datetime.datetime.now().strftime("%Y%m%d") + "_ML.log", encoding="utf-8", format='%(asctime)s %(levelname)s %(message)s', level=logging.INFO)

def etl():
    input_data_filename  = "car.data"
    output_data_filename = "car_converted.csv"
    infile_to_open  = Path("data")/input_data_filename
    outfile_to_open = Path("data")/output_data_filename
    with open(infile_to_open, "r") as data_file:
        lines = csv.reader(data_file, delimiter=",")
        csv_columns = ["buying","maint","doors","persons","lug_boot","safety","values"]
        with open(outfile_to_open, 'w') as csv_file:    
            writer = csv.DictWriter(csv_file, fieldnames=csv_columns)
            writer.writeheader()
            for line in lines:
                converted_row = {}
                converted_row["buying"]   = common.attr_map_buying[line[0]]
                converted_row["maint"]    = common.attr_map_maint[line[1]]
                converted_row["doors"]    = common.attr_map_doors[line[2]]
                converted_row["persons"]  = common.attr_map_persons[line[3]]
                converted_row["lug_boot"] = common.attr_map_lug_boot[line[4]]
                converted_row["safety"]   = common.attr_map_safety[line[5]]
                converted_row["values"]   = common.attr_map_values[line[6]]
                writer.writerow(converted_row)

def start():
    init()
    etl()

if __name__ == '__main__':
    start()
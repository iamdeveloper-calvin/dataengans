import csv 
import logging
import datetime
import common

import numpy  as np
import pandas as pd
from sklearn.tree import DecisionTreeClassifier

def init():
    logging.basicConfig(filename="log/" + datetime.datetime.now().strftime("%Y%m%d") + "_ML.log", encoding="utf-8", format='%(asctime)s %(levelname)s %(message)s', level=logging.DEBUG)

def start():
    init()
    logging.debug("Start")
    # Create a Dataframe from the converted csv
    df = pd.read_csv("data/car_converted.csv")
    logging.debug(df.head())
    # Gets all the rows in the dataset from column 'buying' to column 'safety'
    x_train = df.loc[:,"buying":"safety"] 
    # Gets all of the rows in the dataset from column 'values'
    y_train = df.loc[:,"values"] 
    
    # The actual decision tree classifier
    tree = DecisionTreeClassifier(max_leaf_nodes=3, random_state=0)
    # Train the model
    tree.fit(x_train, y_train)

    prediction = tree.predict([[4,3,2,2,2,3]])
    print(prediction)
    logging.info(str(prediction))

if __name__ == '__main__':
    start()
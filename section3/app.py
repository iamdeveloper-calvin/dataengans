from flask import Flask, redirect
from flask import render_template
import urllib.request, json
import datetime

app = Flask(__name__, template_folder='templates')

def fetchData():
    api = "https://api.covid19api.com/total/country/singapore/status/confirmed?from=2019-01-01T00:00:00Z&to="+datetime.datetime.now().strftime("%Y-%m-%d")+"T00:00:00Z"
    response = urllib.request.urlopen(api)
    data = json.loads(response.read())
    return data

content = fetchData()

@app.route('/')
def home():
    return render_template('home.html', title='Dashboard Prototype')

@app.route('/bar')
def bar():

    covid_datasets = {}

    for item in content:
        year_month = item["Date"][0:7]
        covid_datasets[year_month] = item["Cases"]
    
    covid_labels = []
    covid_cases  = [] 
    
    for key in covid_datasets.keys():
        covid_labels.append(key)
        covid_cases.append(covid_datasets[key])

    bar_labels=covid_labels
    bar_values=covid_cases
    
    return render_template('chart_bar.html', title='COVID-19 Cases in Singapore', max=100000, labels=bar_labels, values=bar_values)

@app.route('/line')
def line():
    
    covid_datasets = {}
    
    for item in content:
        year_month = item["Date"][0:7]
        covid_datasets[year_month] = item["Cases"]
    
    covid_labels = []
    covid_cases  = [] 
    
    for key in covid_datasets.keys():
        covid_labels.append(key)
        covid_cases.append(covid_datasets[key])

    line_labels=covid_labels
    line_values=covid_cases
    
    return render_template('chart_line.html', title='COVID-19 Cases in Singapore', max=100000, labels=line_labels, values=line_values)

@app.route('/reload')
def reload():
    content = fetchData()
    return redirect("/")

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
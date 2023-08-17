# -*- coding: utf-8 -*-
"""
Created on Thu Aug 17 15:50:29 2023

@author: monster
"""

import requests
from bs4 import BeautifulSoup
import csv

def generate_id(idlist, key):
    if key not in idlist:
        idlist[key] = len(idlist) + 1000  
    return idlist[key]

url = 'https://www.auto-data.net/tr/allbrands'
response = requests.get(url)
soup = BeautifulSoup(response.content, 'html.parser')
brand_containers = soup.find_all('a', class_='marki_blok')

brand_id_list = {}
model_id_list = {}
nesil_id_list = {}
data = []

for brand_container in brand_containers:
    brand_name = brand_container.text.strip()
    brand_id = generate_id(brand_id_list, brand_name)
    brand_url = 'https://www.auto-data.net' + brand_container['href']
    brand_response = requests.get(brand_url)
    brand_soup = BeautifulSoup(brand_response.content, 'html.parser')
    model_containers = brand_soup.find_all('a', class_='modeli')

    for model_container in model_containers:
        model_name = model_container.text.strip()
        model_id = generate_id(model_id_list, brand_name + '_' + model_name)
        model_url = 'https://www.auto-data.net' + model_container['href']
        model_response = requests.get(model_url)
        model_soup = BeautifulSoup(model_response.content, 'html.parser')
        generation_containers = model_soup.find_all('strong', class_='tit')  
        
        for generation_container in generation_containers:
            gen_name = generation_container.text.strip()
            nesil_id = generate_id(nesil_id_list, brand_name + '_' + model_name + '_' + gen_name)
            data.append([brand_id, brand_name, model_id, model_name, nesil_id, gen_name])

with open('veriler.csv', 'w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(["brand_id", "brand_name", "model_id", "model_name", "generation_id", "generation_name"])
    writer.writerows(data)

print("basariyla kaydedildi.")

# -*- coding: utf-8 -*-
"""
Created on Tue Aug 15 11:46:31 2023

@author: monster
"""

import requests 
import csv
from bs4 import BeautifulSoup

with open('auto_data.csv', 'w', newline='', encoding='utf-8') as csvfile:
    csv_writer = csv.writer(csvfile)
    csv_writer.writerow(['Marka', 'Model', 'Nesil'])

    base_url = 'https://www.auto-data.net'
    url = base_url + '/tr/allbrands'
    response = requests.get(url)
    soup = BeautifulSoup(response.content, 'html.parser')
    brand_containers = soup.find_all('a', class_='marki_blok')

    for brand_container in brand_containers:
        brand_name = brand_container.text.strip()
        brand_url = base_url + brand_container['href']
        brand_response = requests.get(brand_url)
        brand_soup = BeautifulSoup(brand_response.content, 'html.parser')

        model_containers = brand_soup.find_all('a', class_='modeli')

        for model_container in model_containers:
            model_name = model_container.text.strip()
            model_url = base_url + model_container['href']
            model_response = requests.get(model_url)
            model_soup = BeautifulSoup(model_response.content, 'html.parser')
            generation_containers = model_soup.find_all('strong', class_='tit')

            for generation_container in generation_containers:
                gen_name = generation_container.text.strip()

                csv_writer.writerow([brand_name, model_name, gen_name])

print("Veriler 'auto_data.csv' dosyasına kaydedildi.")

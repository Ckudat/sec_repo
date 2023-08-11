# -*- coding: utf-8 -*-
"""
Created on Fri Aug 11 16:02:19 2023

@author: monster
"""

# -*- coding: utf-8 -*-
"""
Created on Fri Aug 11 15:14:48 2023

@author: monster
"""

import requests
from bs4 import BeautifulSoup

url = 'https://www.auto-data.net/tr/allbrands'
response = requests.get(url)
soup = BeautifulSoup(response.content, 'html.parser')

brand_containers = soup.find_all('a', class_='marki_blok')

with open('brand_models.txt', 'w', encoding='utf-8') as f:
    for brand_container in brand_containers:
        brand_name = brand_container.text.strip()
        brand_url = 'https://www.auto-data.net' + brand_container['href']

        brand_response = requests.get(brand_url)
        brand_soup = BeautifulSoup(brand_response.content, 'html.parser')

        model_containers = brand_soup.find_all('a', class_='modeli')
        model_names = [model_container.text.strip() for model_container in model_containers]

        model_names_str = ', '.join(model_names)
        f.write(f"{brand_name} -*-*- {model_names_str}\n\n")

print("Veriler 'brand_models.txt' dosyasına kaydedildi.")

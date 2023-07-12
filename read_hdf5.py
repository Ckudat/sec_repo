# -*- coding: utf-8 -*-
"""
Created on Wed Jul 12 14:13:03 2023

@author: monster
"""

import h5py
import numpy as np
import matplotlib.pyplot as plt
import cartopy.crs as ccrs
from cartopy.mpl.gridliner import LONGITUDE_FORMATTER, LATITUDE_FORMATTER
import matplotlib.ticker as mticker
dosya = "3B-MO.MS.MRG.3IMERG.20160501-S000000-E235959.05.V07A.HDF5"
f = h5py.File(dosya, 'r')

groups = [ x for x in f.keys() ]
print(groups)
gridMembers = [ x for x in f['Grid'] ]
print(gridMembers)
yagis = f['Grid/precipitation'][0][:][:]
yagis = np.transpose(yagis)
enlem = f['Grid/lat'][:]
boylam = f['Grid/lon'][:]
x, y = np.float32(np.meshgrid(boylam, enlem))

fig = plt.figure(figsize=(21,7))
ax = plt.axes(projection=ccrs.PlateCarree())
ax.set_extent([28, 30, 40, 42])

ax.coastlines(resolution="110m",linewidth=1)
gl = ax.gridlines(crs=ccrs.PlateCarree(), draw_labels=True,
                  linewidth=1, color='black', linestyle='--')
gl.xlabels_top = False
gl.ylabels_right = False
gl.xlines = True
gl.xlocator = mticker.FixedLocator([28.9, 29.0, 29.1, 29.2, 29.3])
gl.ylocator = mticker.FixedLocator([40.9, 41.0, 41.1, 41.2])
gl.xformatter = LONGITUDE_FORMATTER
gl.yformatter = LATITUDE_FORMATTER
gl.xlabel_style = {'size':16, 'color':'black'}
gl.ylabel_style = {'size':16, 'color':'black'}
clevs = np.arange(0,1.26,0.05)
plt.contourf(x, y, yagis, clevs, cmap=plt.cm.rainbow)
plt.title('GPM IMERG 2016 Mayıs Ayı Aylık Ortalama Yağmur Oranı', size=24)
cb = plt.colorbar(ax=ax, orientation="vertical", pad=0.02, aspect=16, shrink=0.8)
cb.set_label('mm / hr',size=20)
cb.ax.tick_params(labelsize=16)
plt.savefig('GPM_3IMERG_mayis_plot.png', bbox_inches='tight', pad_inches = 0.1)
import base64
import h5py
import numpy as np
import matplotlib.pyplot as plt
import cartopy.crs as ccrs
from cartopy.mpl.gridliner import LONGITUDE_FORMATTER, LATITUDE_FORMATTER
import matplotlib.ticker as mticker
from flask import Flask
from io import BytesIO

konumyagis = Flask(__name__)

@konumyagis.route("/")
def harita_yagis():
    
    dosya = "3B-MO.MS.MRG.3IMERG.20160501-S000000-E235959.05.V07A.HDF5"
    f = h5py.File(dosya, 'r')

    groups = [x for x in f.keys()]
    print(groups)
    gridMembers = [x for x in f['Grid']]
    print(gridMembers)
    yagis = f['Grid/precipitation'][0][:][:]
    yagis = np.transpose(yagis)
    
    # İstanbul'un koordinatlarını manuel olarak girin
    enlem_min = float(input("min enlem girin: "))
    enlem_max = float(input("max enlem girin: "))
    boylam_min = float(input("min boylam girin: "))
    boylam_max = float(input("max boylam girin: "))
    
    enlem = f['Grid/lat'][:]
    boylam = f['Grid/lon'][:]
    x, y = np.meshgrid(boylam, enlem)
    
    ax = plt.axes(projection=ccrs.PlateCarree())
    ax.set_extent([boylam_min, boylam_max, enlem_min, enlem_max])
    
    ax.coastlines(resolution="110m", linewidth=1)
    gl = ax.gridlines(crs=ccrs.PlateCarree(), draw_labels=True,
                      linewidth=1, color='black', linestyle='--')
    gl.xlabels_top = False
    gl.ylabels_right = False
    gl.xlines = True
    gl.xlocator = mticker.FixedLocator([boylam_min, boylam_max])
    gl.ylocator = mticker.FixedLocator([enlem_min, enlem_max])
    gl.xformatter = LONGITUDE_FORMATTER
    gl.yformatter = LATITUDE_FORMATTER
    gl.xlabel_style = {'size': 16, 'color': 'black'}
    gl.ylabel_style = {'size': 16, 'color': 'black'}
    clevs = np.arange(0, 1.26, 0.05)
    plt.contourf(x, y, yagis, clevs, cmap=plt.cm.rainbow)
    plt.title('GPM IMERG 2016 Mayıs Ayı Aylık Ortalama Yağmur Oranı', size=24)
    cb = plt.colorbar(ax=ax, orientation="vertical", pad=0.02, aspect=16, shrink=0.8)
    cb.set_label('mm / hr', size=20)
    cb.ax.tick_params(labelsize=16)
    
    # Belirtilen koordinatlar arasındaki verileri göster
    enlem_indeks_min = int((enlem_min - enlem[0]) / (enlem[1] - enlem[0]))
    enlem_indeks_max = int((enlem_max - enlem[0]) / (enlem[1] - enlem[0]))
    boylam_indeks_min = int((boylam_min - boylam[0]) / (boylam[1] - boylam[0]))
    boylam_indeks_max = int((boylam_max - boylam[0]) / (boylam[1] - boylam[0]))
    
    plt.imshow(yagis[enlem_indeks_min:enlem_indeks_max, boylam_indeks_min:boylam_indeks_max], cmap='rainbow',
               extent=[boylam[boylam_indeks_min], boylam[boylam_indeks_max], enlem[enlem_indeks_min], enlem[enlem_indeks_max]])
    
    buf = BytesIO()
    plt.savefig(buf, format='png')
    data = base64.b64encode(buf.getbuffer()).decode("ascii")
    return f"<img src='data:image/png;base64,{data}'/>"
if __name__ == '__main__':
    konumyagis.run(debug=False)
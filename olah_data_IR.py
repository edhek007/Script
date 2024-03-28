import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

#variabel atau list
rasioY = []
ytransmitansi = []
join = []

#konstanta. Digunakan untuk mengkalikan bilangan gelombang. Nilainya bisa berbeda-beda, tergantung pada metode yang digunakan untuk running.
faktorSkala = 0.9029

#import data
#data pada kolom 0 dan 1 dalam file butana_ir.txt dimasukkan dalam variabel datax dan datay.
datax,datay = np.loadtxt('butana_ir.txt', comments='#', usecols=(0, 1), unpack=True)

for a in range(len(datay)): #melakukan perulangan pembagian antara nilai y (absorbansi) dengan nilai maksimal dalam data y
    rasio = datay[a]/max(datay)
    rasioY.append(rasio)

xbaru = datax * faktorSkala
for a in range(len(datay)):
    operasi = 1 - rasioY[a]
    ytransmitansi.append(operasi)

#tidak harus
for a in zip(xbaru,ytransmitansi):
	join.append(list(a))

headerlist = ['Bilangan Gelombang', 'Transmitansi']
df = pd.DataFrame(join)
df.to_csv('IRbutana.csv', sep='\t', header=headerlist, index=False)
#tidak harus

#graph, (plot1) = plt.subplots(1)
#plot1.plot(xbaru, ytransmitansi)
#plot1.invert_xaxis()
plt.plot(xbaru, ytransmitansi)
plt.xlim(max(xbaru), min(xbaru)) #digunakan untuk membalik sumbu x (bilangan gelombang)

plt.xlabel("Bilangan Gelombang")
plt.ylabel("Transmitansi")

plt.show()

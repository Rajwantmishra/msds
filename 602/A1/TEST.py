import matplotlib.pyplot as plt
import numpy as np
# print("RE")
# y = [10,20,30,40]
# t = [1,2,3,4]
# plt.plot(t,y)
# plt.scatter(t,y)
# # Strings
# xlab = 'GDP per Capita [in USD]'
# ylab = 'Life Expectancy [in years]'
# title = 'World Development in 2007'

# # Add axis labels
# plt.xlabel(xlab)
# plt.ylabel(ylab)

# # Add title
# plt.title( title)

# plt.show()

a= [1,2,3]
np_a= np.array(a)
print(np_a*2)

countries = ['spain', 'france', 'germany', 'norway']
capitals = ['madrid', 'paris', 'berlin', 'oslo']

print(len(countries))
a= {countries[n]:capitals[n] for n in range(len(countries))}

print("[[[[[]]]]]",type(a))

print(a.keys())
print(a['norway'])

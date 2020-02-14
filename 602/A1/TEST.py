import matplotlib.pyplot as plt
import numpy as np
import requests as r
# # print("RE")
# # y = [10,20,30,40]
# # t = [1,2,3,4]
# # plt.plot(t,y)
# # plt.scatter(t,y)
# # # Strings
# # xlab = 'GDP per Capita [in USD]'
# # ylab = 'Life Expectancy [in years]'
# # title = 'World Development in 2007'

# # # Add axis labels
# # plt.xlabel(xlab)
# # plt.ylabel(ylab)

# # # Add title
# # plt.title( title)

# # plt.show()

# a= [1,2,3]
# np_a= np.array(a)
# print(np_a*2)

# countries = ['spain', 'france', 'germany', 'norway']
# capitals = ['madrid', 'paris', 'berlin', 'oslo']

# print("----------",len(countries))
# a= {countries[n]:capitals[n] for n in range(len(countries))}

# print("[[[[[]]]]]",type(a))

# print(a.keys())
# print(a['norway'])

# [print(capitals[i]) for i in range(len(capitals))]

# countdown = [4, 8, 12, 5, 4]
# the_fifth_element = -999
# print(type(countdown))

# [print(countdown[i]) for i in range(len(countdown))]

# countdown.sort( reverse=True)

# print("-----------")
# [print(countdown[i]) for i in range(len(countdown))]

# print('Sorted list (in Descending):', countdown[4])

# temperatures = list(np.random.randint(-25, 25, size=10))
# more_temperatures = np.random.randint(300, 400, size=25)
# iot_sensor_points = {1: 801, 2: 644, 3: 991, 4: 721,5: 752, 6: 871, 7: 991, 8: 1023, 9: 804, 10: 882}
# a = 12121
# b = 19
# c = 3212
# d = 3223
# e = 32
# samples = []
# copy_of_samples = []
# temperatures = np.append(temperatures,more_temperatures)            # 1 Adding more_temperatures
# temperatures = np.append(temperatures, list(iot_sensor_points.values()))  # 1 Dict values for temperatures
# temperatures = np.append(temperatures,[a,b,c,d,e])        # Adding a b c d e
# # temperatures.sort()
# # print(temperatures)
# temperatures[::-1].sort()
# print("SORTED----------->",temperatures)

#  # 5. The samples list will contain every 5th reading from the final temperatures list i.e in list [1,2,3,4,5,6,7,8,9,10] samples would be [5,10]
#     # 6. Do a shallow copy of samples into copy_of_samples
#     # 7. Organize samples in ascending order
# print("------------temperatures:....",temperatures)
# samples = [temperatures[i] for i in range(len(temperatures)) if (i+1)%5==0 and i!=0]
# print("------------5 Sample:....",samples)
# copy_of_samples = [samples[i] for i in range(len(samples))] # Shallow copy
# print("Smaple--",samples)
# samples.sort()
# print("Smaple--",samples)

# import copy

# def copy1(x):
#     """Shallow copy operation on arbitrary Python objects.

#     See the module's __doc__ string for more info.
#     """

#     cls = type(x)

#     # copier = _copy_dispatch.get(cls)
#     # if copier:
#     #     return copier(x)

#     if issubclass(cls, type):
#         # treat it as a regular class:
#         return _copy_immutable(x)

#     copier = getattr(cls, "__copy__", None)
#     if copier is not None:
#         return copier(x)

#     reductor = dispatch_table.get(cls)
#     if reductor is not None:
#         rv = reductor(x)
#     else:
#         reductor = getattr(x, "__reduce_ex__", None)
#         if reductor is not None:
#             rv = reductor(4)
#         else:
#             reductor = getattr(x, "__reduce__", None)
#             if reductor:
#                 rv = reductor()
#             else:
#                 raise Error("un(shallow)copyable object of type %s" % cls)

#     if isinstance(rv, str):
#         return x
#     return _reconstruct(x, None, *rv)


# import copy
# old_list = [[1, 1, 1], [2, 5, 2], [3, 3, 3]]
# new_list = copy.copy(old_list)
# old_list[1][1] = 'AA'
# old_list.append([4, 4, 4])

# print("Old list:", old_list)
# print("New list:", new_list)
# print('ID of Old List:', id(old_list))
# print('ID of New List:', id(new_list))


# old_list1 = [[1, 1, 1], [2, 5, 2], [3, 3, 3]]
# new_list1 = [ old_list1[i] for i in range(len(old_list1))]

# print("----------------------------------------------------")
# print("AS IS ......",new_list1)
# old_list1[1][1] = 'AA'
# old_list1.append([4, 4, 4])
# old_list1 = old_list1 + old_list1
# print("Old list1:", old_list1)
# print("New list1:", new_list1)
# print('ID of Old List:', id(old_list1))
# print('ID of New List:', id(new_list1))


# def exercise07(a):
#     # This function looks for duplicates in list n. 
#     # If there is a duplicate True is returned. 
#     # If there are no duplicates False is returned.

#     # ------ Place code below here \/ \/ \/ ------
#     dup_value = {a[i]:len([a[j] for j,x in enumerate(a) if x==a[i] ]) for i in range(len(a)) }
#     dup_value = list(dup_value.values())
#     print("Dup value ---",dup_value)
#     if True in [dup_value[k] > 1 for k in range(len(dup_value))]:    
#     # if True in [n[i] in n for i in range(len(n))]:
#         return True
#     else:
#         return False
#     #  {a[i]:a[j] for i in range(len(a)) for j,x in enumerate(a) if x==a[i]}
    
#     # {a[i]:[a[j] for j,x in enumerate(a) if x==a[i] ] for i in range(len(a)) }
#     #result = {a[i]:len([a[j] for j,x in enumerate(a) if x==a[i] ]) for i in range(len(a)) 
#     # dup_value = {a[i]:len([a[j] for j,x in enumerate(a) if x==a[i] ]) for i in range(len(a)) }
#     # dup_value = list(dup_value.values())
    
    
# print("--------------",exercise07([1,2,3,3]))
# a = [1,2,3,4,3]
# dup_value = {a[i]:len([a[j] for j,x in enumerate(a) if x==a[i] ]) for i in range(len(a)) }
# dup_value = list(dup_value.values())
# print("Dup value ---",dup_value)
# if True in [dup_value[k] > 1 for k in range(len(dup_value))]:
# [a[i] for i,x in enumerate(a) if x==1]

# for i in range(len(a)):    
#     print("....",a[i],"----",[a[j] for j,x in enumerate(a) if x==a[i]])

# def exercise05(n):
#     # This function will find n factorial using recursion (calling itself) 
#     # and return the solution. For example exercise05(5) will return 120. No Python functions are to be used.

#     # ------ Place code below here \/ \/ \/ ------ 
#     if n <=1:
#         one = 1
#         return one
#     result = n * exercise05(n-1)
#     return result

# a = [1,1,2,4,5,6,7]
# print(len(a))
# print(exercise05(-7))

#-----------------------------------Request-------------


# reqI = req.get('https://random.dog/woof.json')
# resultUrl = reqI.json()
# imageUrl = resultUrl['url']
# # print(imageUrl)
# print(imageUrl)

# l_urlStartExt = [i for i, j in enumerate(imageUrl) if j == '.'][-1:]  # Taking last . from the url name
# l_urlStopExt = len(imageUrl) 
# l_urlImgExt = imageUrl[l_urlStartExt[0]:l_urlStopExt]
# print(l_urlImgExt)
# validImg= ['.jpg',',jpeg','.png','.gif'] 
# if l_urlImgExt in validImg:
#     print('Valid ',l_urlImgExt)
    

dogs = []
url = 'https://random.dog/woof.json'
dog_media = r.get(url=url)
print(str(dog_media.content))

validImg= ['.jpg',',jpeg','.png','.gif'] 
while len(dogs)<11:
    resultUrl = dog_media.json()
    imageUrl = resultUrl['url']
    print(imageUrl)
    l_urlStartExt = [i for i, j in enumerate(imageUrl) if j == '.'][-1:]  # Taking last . from the url name
    l_urlStopExt = len(imageUrl) 
    l_urlImgExt = imageUrl[l_urlStartExt[0]:l_urlStopExt]
    print('Ext...:',l_urlImgExt)
    if l_urlImgExt in validImg:
        print('Valid ',l_urlImgExt)
        dogs.append(imageUrl)
    dog_media = r.get(url=url)

print('FINAL len {}...value{}'. format(len(dogs),dogs))
# # print(imageUrl)
# print(imageUrl)

# l_urlStartExt = [i for i, j in enumerate(imageUrl) if j == '.'][-1:]  # Taking last . from the url name
# l_urlStopExt = len(imageUrl) 
# l_urlImgExt = imageUrl[l_urlStartExt[0]:l_urlStopExt]
# print(l_urlImgExt)
# validImg= ['.jpg',',jpeg','.png','.gif'] 
# if l_urlImgExt in validImg:
#     print('Valid ',l_urlImgExt)

    
# ssn = requests.Session()
# ssn.cookies.update({'visit-month': 'February'})
 
# reqOne = ssn.get('http://httpbin.org/cookies')
# print(reqOne.text)
# # prints information about "visit-month" cookie
 
# reqTwo = ssn.get('http://httpbin.org/cookies', cookies={'visit-year': '2017'})
# print(reqTwo.text)
# # prints information about "visit-month" and "visit-year" cookie
 
# reqThree = ssn.get('http://httpbin.org/cookies')
# print(reqThree.text)
# # prints information about "visit-month" cookie

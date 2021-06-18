#!/usr/bin/env python
# coding: utf-8

# In[77]:


import matplotlib.pyplot as plt
import pandas as pd
import os


# In[85]:


data = pd.read_csv('SnowEx2020.snowdepth.snowstakes.alldepths_clean_v2.csv')


# In[86]:


data.head()


# In[ ]:





# In[87]:


# some housekeeping 
temp = pd.to_datetime(data['Date&Time'], format='%m/%d/%Y %H:%M') ## check for the seconds 
data['temp'] = temp
print(type(temp[1])) # <class 'pandas._libs.tslibs.timestamps.Timestamp'>

data


# In[88]:


CameraID = data['Camera'].unique()
dataframes = {} ## make it an empty dictionary 

for i in range(len(CameraID)):
    dataframes[i] = data[data['Camera'] == CameraID[i]]

data_dict = dict(zip(CameraID, list(dataframes.values())))
data_dict


# In[89]:



data_dict.keys()


# In[90]:


data_dict.items()


# In[102]:


fig = plt.figure(figsize=(16,10))

for key,value in data_dict.items():


    name = data_dict[key]
    plt.scatter(value['temp'],value['Depth (cm)'], c='lightgray')

    #plt.legend(prop={'size': 25})
    #plt.xlim([1,len])


daily_average = data.resample('D', on='temp').mean()
average = plt.scatter(daily_average.index,daily_average['Depth (cm)'], label = "daily average")
plt.xlabel('Date', fontsize=25)
plt.ylabel('Snow Depth (cm)', fontsize=25)
#ax.set_xlabel('Date')
#ax.set_xlim(0,24)
#ax.set_ylabel('Ux (m/s)')
plt.legend()
plt.show()





# In[92]:


value


# In[67]:





# In[ ]:


data


# In[103]:


fig.savefig('plot.png')


# In[32]:


data_dict['W1B']['temp']


# In[ ]:





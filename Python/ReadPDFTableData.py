#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np
import os
import glob
import csv
import smtplib
import shutil


# In[2]:


path=os.getcwd()


# In[3]:


print(path)


# In[4]:


# csv_files = glob.glob('*.{}'.format('xlsx'))
csv_files =  glob.glob('Files/*.xlsx')


# In[5]:


print(csv_files)


# In[12]:


s = smtplib.SMTP('smtp.gmail.com', 587)
s.starttls()
s.login("nuthalapatinareshbabu@gmail.com", "kfzrtphzmyzboazn")


# In[ ]:





# In[13]:


for j in csv_files:
    src=path+"\\"+j
    temp=pd.read_excel(str(j))
    print('File Name : ' + j)
    for i in range(temp.shape[0]):
        to_mail=temp['tomail'][i]
        content=temp['content'][i]
        s.sendmail("nuthalapatinareshbabu@gmail.com",to_mail, content)
        print(to_mail)
    dst=path+"\\archive\\"+j
    shutil.move(src,dst)
s.quit()


# In[ ]:





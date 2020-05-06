#!/usr/bin/env python
# coding: utf-8

# In[89]:


from sqlalchemy import create_engine
import pandas as pd
import pandas.io.sql as psql
#import PyGreSQL as pg
#from _pg import DB
import matplotlib.pyplot as plt
from config import username,psword


# In[90]:


from sqlalchemy import create_engine
engine = create_engine(f'postgresql://{username}:{psword}@localhost:5432/PewlettHackardEmp')
connection = engine.connect()


# In[91]:


sal_df = pd.read_sql_query('select * from salaries',connection)
sal_df


# In[79]:


#Use salary db to create histogram of different salary ranges
sal_df.hist(column = 'salary')
plt.title("Distribution of Salaries")
plt.ylabel("Number of Employees")
plt.xlabel("Salary ($)")


# As expected with most salaries of companies the distribution is extremely right skewed with most workers making in the 40-60k range and a few making significantly larger amounts.

# In[54]:


#Turn query for department and average salary into a db
dept_sal_comp_df = pd.read_sql_query("""SELECT d.dept_name as Department, 
ROUND(AVG(s.salary),2) as Average_Salary 
FROM salaries s
INNER JOIN employee e
ON s.emp_no = e.emp_no
INNER JOIN dept_emp de
ON e.emp_no = de.emp_no
INNER JOIN department d
ON de.dept_no = d.dept_no
GROUP BY d.dept_name
ORDER BY Average_Salary""",connection)


# In[ ]:





# In[84]:


#Create bar graph of average salaries by department
departments = list(dept_sal_comp_df['department'])
positions = [x for x in range(9)]
dept_sal_comp_df.plot.bar(legend = False)
plt.xticks(positions,departments)
plt.title("Average Salaries by Department")
plt.ylabel("Average Salary")


# In[ ]:





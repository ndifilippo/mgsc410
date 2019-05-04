## Welcome to Keita & Nick's Applied Analytics Project   

Hi Duncan, this is our [workflow for our project](https://drive.google.com/file/d/1WSKUeWjirDklZm_4Md1jvWOxYGtyvEtC/view?usp=sharing).

## Section 1: Goal of the Analytical Plan  
Set forth a plan that is specific, yet flexible enough to shift in case of a change. Using the tools taught in case, our analytical plan contains eight sections with each section addressing a step in the analytical process. With 12 days till we present, priorities matter. We've identified five key sections that play a roll in our project: analytical plan, data cleaning, modelling, visualization, and presentation. To stay realistic with our goal, we've created a timeline in order to keep each other accountable. In by doing so, we believe delivering an impactful presentation is possible despite limited time.    

## Section 2: Main objective / Problem  
Our main objective is to design and communicate an analytical plan for determining the best 10 markets (DMA) to compete effectively against an established competitor such as Walmart. The main results should be in the form of an analytical plan of our workflow / findings / etc, a presentation, and a github page with all of our datasets and codings.  

## Section 3: Result _(What is our end goal)_  
The main result or output of the project is to have a written analytical plan in the form of a document, powerpoint presentation with all of our findings, a github repository of all the resources, and an x-factor (which may be in a form of a website, dashboard, dynamic html/markdown).  

## Section 4: Resources and Technology  
Data resources are as follows: Walmart Sales, Features, and Store come from Kaggle; The Consumer Expenditure Survey is done by the Bureau of Labor Statistics; Population data came from the Census Bureau. All data can be joined to one master file but is not advised due to file size and computation power limitations. Technology used: R for data cleaning and modeling, SQL to store data instead of a csv, SQL to join and aggregate the data, Tableau and R for visualization. Slack is used for communication. GitHub for version control. 

## Section 5: Data Concerns  
The Consumer Expenditure Survey (CE) from the Bureau of Labor Statistics contains information from 2016. To avoid look-ahead bias, we've gathered data from the same survey but from an earlier time period. CE was gathered from 2008-2014. 
Cleaning and joining data might be an issue because cities, MSAs, DMAs, regions, counties, and states do not align. An appropriate amount of time must be put aside in order to fulfill this duty.  

## Section 6: Structure and Team  
For structuring the project, we have split the workload into two main part: Visualization and Modelling. Visualization incorporates using sales-aid technology tools to create a dashboard and insights will be derived from the findings solely from the dashboard. Modelling will use programming languages such as R and Python to find top 10 DMA location using predictive modeling and unstructured data analysis.

## Section 7: Reporting and Visualization  
**Visualization:**  
Using Tableau as the main Business Intelligence tool, we were able to come up with 10 initial DMA locations. San Diego, Salt Lake City, Houston, Tampa, Los Angeles, Cleveland, Philadelphia, and Austin were the location that seemed to be most appropriate for the retail launch locations. The insights were derived from 4 main charts: geographical chart that displays the percentage change of population for each States, a heat map that indicates each DMA’s median household income, bar chart that displays the optimized sales information by overlaying average weekly sales per store size against average weekly sales, and weekly sales shown as a line graph over 4 quarters. Our decisions of the top 10 locations were decided based on 4 key metrics: (1) location should be in an area with a growing population, (2) median household income of around $60,000 to $75,000, (3) the location should also be in above the 50th percentile for average weekly sales per store size, and (4) preferably a location with unemployment rate of less than 7.5%.

Result: [Dashboard made from Tableau](https://public.tableau.com/shared/JHNYQR36C?:display_count=yes).

**Modelling/Reporting:**  
Both supervised and unsupervised learning methods are desirable for this presentation. For supervised, linear regression will suffice and for unsupervised either K-Means or PCA will be used. 

## Section 8: Timeline
![Draw.io Timetable](Timetable.png)

Syntax highlighted code block
```
# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

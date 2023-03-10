# Crowdfunding-ETL

## Overview of Analysis
The purpose of this analysis was to extract, transform, and load the data for independent funding by creating new CSV files then importing them into individual tables through SQL databases. Using generated ERD's to better navigate our coding path and manipulate code to process specific data information to be analyzed.

## Results
The image below show the entity relationship diagram between the CSV files and table columns to illustrate an overview of a database schema. We can display and locate the primary keys and foreign key of each table showing the relationship of each entity.

![crowdfunding_db_relationships](https://user-images.githubusercontent.com/118647523/216477150-99d2d509-baff-435f-9961-19619fe02291.png)

To narrow down the information we use Jupyter notebook and Python code to extract and transform the information requested. After performing code we generate the remaining columns listed backer_id, cf_id, names, and emails. 

![Dev1](https://user-images.githubusercontent.com/118647523/216477173-46832eac-cf6e-47e8-a9b4-aafcd3201206.png)

As seen below we format the same dataset by splitting the names for better viewing and convert the data types. By creating the necessary dataframe we then can export the data into a CSV file which become ready to load into postgreSQL. 

![Dev2](https://user-images.githubusercontent.com/118647523/216477186-174d66ef-2ee5-4e95-976a-3f5330dff200.png)

Through pgAdmin we query a new table generated from the previous entity relationship diagram created. Once the schema is set we can import the CSV file created from the python into our newly created table and alter the infomation as needed. The data and image will come out identical with style being slight different. 

![Dev3](https://user-images.githubusercontent.com/118647523/216477196-a17c5608-0ecb-42c1-86c2-efd97a1fc52d.png)

In SQL we adjust the data to add additional columns and organize other columns by cleaning up the data. The remaining goal category is add to the end of our table to display the numeric funding value. 

![Dev4](https://user-images.githubusercontent.com/118647523/216477205-da80c9b8-a453-43e6-9511-fdd9cbca5b8a.png)

The last table image is generated from code to show the email information of each backers name to list the goal remains for each live campaign they have pledged.

![Dev4-1](https://user-images.githubusercontent.com/118647523/216477212-d2808916-4aed-482f-ac71-b272db71b7f0.png)

## Summary 

The purpose of ETL (Extract, Transform, Load) is to pull together data from multiple sources into a single dataset for better analysis. The transformed data is often cleaned, filtered, and processed to ensure data quality, accuracy, and consistency.

  * Extracting data from various sources.
  * Transforming the data into a format that can be loaded into a database.
  * Loading the transformed data into a desired database.

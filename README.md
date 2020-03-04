# Spective 
The source code of mobile application for SIH 2019-2020


### Problem

Around 3.3 crore case files in India are stored physically, making them prone to damage, difficult to backup, search and analyze.
Difficult to identify patterns in crimes, and connected incidences.
Cases are not being prioritized depending on the urgency of the issues.
Need of management of beats, resource allocation is difficult, form fillings are complicated, request for NOC need to be streamlined, obtaining appointments of officers is tedious.


### Solution

An end-to-end unified, cross-platform system to file complaints, manage, and analyze records at a scale digitally, across all the stations in the country.
Stored data can be analyzed, patterns and repeat offenders can be detected easily.
An easy to use mobile app for citizens to file complaints and receive updates.
Appropriate allocation of units for beats and crime prediction based on historical data.
Handle forms filings and functionalities to apply for NOC online, along with required document submissions. 
Making form fillings as easy as ordering food or booking an Uber.

### App UI
 <img src="https://user-images.githubusercontent.com/42350771/75901932-46c14300-5e65-11ea-8dc2-5d76e95f7b1a.gif" width="450" height="720">

### Technology Stack
 <img src="https://user-images.githubusercontent.com/42350771/75901299-4d9b8600-5e64-11ea-9dc3-1798ff7714a2.png" width="768" height="720">

#### Citizen App
Citizen can file complaints in fast , easy and natural manner
NOC request and booking for appointments made easier
#### Police App
Perfect tool to visualize and gain insights not possible before
Allocates region for beats
#### Node APP
Backend of the application
Connects the citizen app and police app
Stores and Retrieves data to/from Database
#### ML Backend - Flask App
Process the complaints using NLP to gain useful insights
Extract Crime Details from images to convert physical images to data
Database - MongoDB
Hosts the data generated
Prototype of Citizen APP

#### Use Case

User describes the crime in a natural manner. The system can  identify crime details from the user’s description.
System stores & processes the information,classifies the crime & calculates crime predictions.
System displays the crime report to the designated police officer based on classification.
System suggests regions for allocating beats units.

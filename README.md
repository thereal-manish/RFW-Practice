# RFW-Practice
This is repo is to collaborate for test script development

*** EVERY DAY IS A LEARNING DAY ***

 This project is to automate the NOPCOMMERCE website using RobotFramework Selenium
 
 Tools & Libraries
 -----------------
 1.Python -3.11.3
 2.Robotframework - 6.0.2
 3.Robotframework-seleniumlibrary - 6.1.0
 4.Robotframework-faker - 5.0.0
 5.selenium - 4.9.1
 
 steps:
 Create requirements.txt file under project and store all dependencies in it
 create venv and select latest python version, enable requirements.txt file and then click ok
 finally it will download latest version that had mention in requirements file
 
 To run testcases and test suites in parallel
 ---------------------------------------------
 1. To run test suites parallel but test cases in sequentially --
     pabot --suitelevelsplit Register.robot
 2. To run parallel test suites and testcases parallely --
     pabot --testlevelsplit Register.robot
     
To generate Timestamps & report using Command line
---------------------------------------------------
   robot -T -l Mylog.html -o myoutput.xml -r myreport.html
   
To generate Screenshots
-----------------------
1. have to install Pillow 
2. using robot screenshot keyword 
   Take Screenshot  pathName
   
Create Muliple Config files and pass arguments 
---------------------------------------------
1. create .args file under TestCase
2. store all common variables in it
3. use command 
    robot -A .args filename TestCaseName[.robot fileName]
    robot -A .args filename  --variable browserName: Firefox TestCaseName[.robot fileName]
    
 To store Output file in results folder under TestCases
 ------------------------------------------------------
 *** directory -d ***
 robot -T -d Results -l mylog.html -o myoutput.xml -r myreport.html Register.robot

    
   
   
   

 
     
     
     
     

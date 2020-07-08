# mywebapp

1. the project using cloud formation template, that bring up new enviroment that have high availabilty rds mysql DB and load balancer with auto scaling group.
2. the project  deployed on multi AZ 
3. dns assigned to the load balancer 
4. scale up and down the servers group regarding to CPU utilization ,
5. the project using aws SNS to send email notifaction when scale up or down occured
6. the project configure puppet agent on each server with uniqe certname  that allow the attached module to run and update the apache server. 
7. the project running  a web app that connecting to the db and get data from it , also have a form that insert data to db.
8. jenkinsFile attached to bring up the env , the jenkins job should wait to the deployment to finish and update the status regaring to it.




![alt text](https://github.com/Fadih/mywebapp/master/screenshot.png?raw=true)


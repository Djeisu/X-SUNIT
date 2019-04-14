# README

**This is an _REST API_ develop for testing my skills in the job's select proccess of the gocase**

# Configs

* Framework: **Rails**
* Language: **Ruby**
* Database: **PostgreSQL**

# For Using

## Install gems

```
 $ bundle install
```

## Create database

```
 $ rake db:create
```

## Create Tables and Triggers in Database

```
 $ rake db:migrate
```

## Populate Database with survivors

```
 $ rake db:seed
```

## Start serve

```
 $ rails s
```

## This is command line for create triggers if you need change anything

```
 * Generate triggers. (don't need run this, please not run this if your not know how use)
 $ rake db:generate_trigger_migration
```

# For Testing

## Default Route 

```
    URL: localhost:3000/api/v1/
```

## Show all survivors order by name

```
    GET: localhost:3000/api/v1/survivors
```

## Show survivor by id

```
    GET: localhost:3000/api/v1/survivors/:id
```

## Create new register of survivor

```
    POST: localhost:3000/api/v1/survivors
   
    {
        "name":"Djheyson Oliveira",
        "age": 23,
        "gender":"Male",
        "latitude": 77.332874,
        "longitude": -29.017317
    }

    {"name":String,"age":Integer,"gender":String,"latitude":Decimal,"longitude":Decimal}
```

## Update Location

```
    PUT: localhost:3000/api/v1/survivors/update-location/:id

    {
        "latitude": 24.332874,
        "longitude": -33.017317
    }

    {"latitude": Decimal, "longitude": Decimal}
```

## Report Abductedion

```
    POST: localhost:3000/api/v1/report

    {
        "survivor_report_id": 4,
        "survivor_abducted_id": 3
    }

    {"survivor_report_id": Integer, "survivor_abducted_id": Integer}
```

## Reports

* Percentage of abducted survivors.

```
    GET: localhost:3000/api/v1/report/abducteds/
```

* Percentage of non-abducted survivors.

```
    GET: localhost:3000/api/v1/report/non-abducteds/
```

* List of all survivors names, by alphabetic order, with an identification to know who was abducted.

**All Infomations**

```
    GET: localhost:3000/api/v1/survivors/
``` 

**List of names, by alphabetic order, is Abudcted?**

```
    GET localhost:3000/api/v1/report/survivors
```

**Last Location by id**

```
    GET: localhost:3000/api/v1/report/last-location/:id
```

#Considarations

I Realy liked developing this REST API, I wanted to learn about Ruby and the framework Rails, but I didn't start yet, with this opportunity I could praticed and see little a little bit bit how Ruby on Rails worked.

About the code. I applied some simple techniques. 

####In the Database I created three tables:

* *survivors*: This table keeps all the basic informations of the people. As flag abducted is for determine if that survivor is abducted or non-abducted, basically.

* *log_location*: This table is for keeping the informations of the all locations registered in the base, I created this table in case other survivor wants to track one person. A Trigger is responsible for inserting new rows in that table whenever a location in table survivors is changed.

* *report_abduceted*: This table is for keeping the abduction reports of anyone. In this case I created one filter for a survivor report an abduction if they haven't been abducted and they don't report its own abduction. Whenever one data is inserted in the table a trigger is executed checking if that reported survivor has three or more reports, if it has the trigger will update the row of that survivor in the Table survivors checking true in the column _"abducted"_.

*I opted for using triggers because it is more confortable for me, Using this technique I can let the database execute some functions and don't leave all codes for my controller. And sometimes it's faster to use triggers.*
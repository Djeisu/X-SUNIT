# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# For Using

## Instaling gem

```
 $ bundle install
```

## Create database Postgresql

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

 ### Route Survivor: localhost:3000/api/v1/survivors

## Show all survivor order by name here

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
## Report Abducted

```
    POST: localhost:3000/api/v1/report

    {
        "survivor_report_id": 4,
        "survivor_abducted_id": 3
    }

    {"survivor_report_id": Integer, "survivor_abducted_id": Integer}
```
# Explication
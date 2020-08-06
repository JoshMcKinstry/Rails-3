# Rails-2

A starter rails app, for CS3710 Assignment 1.

## Assignment Details

#### Assignment-1

A car part has a name and belongs to many cars.

A car make has a name and country.

Cars have make and model names, VIN numbers and many parts.

Need to create a CarParts model or scaffold.

In the form for a car have a drop down with a list of possible parts to be added.

#### Assignment-2

Requires that all models be validated and that searching be added for each index function.

Unit test all code.

## Product Details

##### Ruby Version

- 2.5.3

##### Rails Version

- 5.2.4

### Install

Clone this repository to have access. Before running any code, make sure you have the correct ruby and rails versions and run the following on the terminal.

    bundle install

### Usage Instructions

To start up the server, go to the terminal, navigate to the Rails-1 directory and use

    rails server

On your browser, navigate to localhost:3000/cars

Currently, the only views in the app are related to cars. There are no routes and no controller for parts or makes. In order to create new parts or makes, use the rails console.

    rails console

This will start up the console. Once here, use the method create for either object to create new parts or makes.

    Part.create(name:"name here")

    Make.create(name:"name here", country:"country here")

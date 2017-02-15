# Friends with Benefits
A friend-to-friend web app where people ask for, give and get help with everyday tasks.
[Try it out here.](https://fw-benefits.herokuapp.com/)

Created by: [Matt Fender] (https://github.com/mjfender/), [Elizabeth Jacobs] (https://github.com/LizzyJacobs), [Ashley Robinson](https://github.com/Howers) and [Kavitoj Singh] (https://github.com/KavitojSingh)

## Summary

**Why**

We believe there should be an easy way for people to tap into their existing networks and get the help they need.  This strengthens communities and makes the sharing economy personal and hyper-local.

Apps like TaskRabbit are great for finding an expert or professional, but many everyday tasks can be easily fulfilled by a friend or neighbor. FwB is designed specifically to connect users to the help they need or could give to others

**Stack**

* Built with Ruby on Rails
* Uses a PostgreSQL database

**Functionality** 

Meet Sally. Sally is new New Yorker and is busy getting her apartment set up. She hears about FwB and creates an account because she needs help with a simple household tasks (and also wants to get to know her new neighbors)! She joins the existing group for her apartment building (Stuy Town) and in just a few minutes she is able to ask her neighbors for help with the shelf she needs to install.  Within a few hours, three Stuy Town group members offer to help. Sally is well on her way to creating an event and meeting her brand new Friends with Benefits.

**Features**
* A web application that empowers users to give and get help from their friends and networks
* Users ask friends for help, get replies and create an event
* Users join or create groups based on shared location or interest
* Once part of a group, users can offer to help members of that group and ask the group for help when they need it

## Technical Details

**Dependencies**
* Ruby version 2.2.6
* Rails version 5.0.1
* PostgreSQL version 9.6
* bCrypt gem 3.1.11
* materialize-sass 0.97.8

**Approach**
* Adhered to RESTful conventions to follow best practices and write easily readable code
* Employed an MVC pattern to efficiently organize the project files
* Utilized the Materialize CSS library to add custom styling to our views 
* Made a secure sign-up and login process, leveraging the session store to authenticate users and limit access

## Product Roadmap

* Recommend or automatically add new users to groups based on their zip code, the interests selected during sign-up, etc
* Create default avatar images that are customized with the first letter of a user's name
* Allow users to offer an incentive for their task requests


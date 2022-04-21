```
                 )       (    (               )        
 (  `     (       ( /(       )\ ) )\ )     (   ( /(    (   
 )\))(    )\      )\()) (   (()/((()/(   ( )\  )\()) ( )\  
((_)()\((((_)(  |((_)\  )\   /(_))/(_))  )((_)((_)\  )((_) 
(_()((_))\ _ )\ |_ ((_)((_) (_)) (_))   ((_)_  _((_)((_)_  
|  \/  |(_)_\(_)| |/ / | __|| _ \/ __|   | _ )| \| | | _ ) 
| |\/| | / _ \    ' <  | _| |   /\__ \   | _ \| .` | | _ \ 
|_|  |_|/_/ \_\  _|\_\ |___||_|_\|___/   |___/|_|\_| |___/ 
```

# Makers BnB

Makers BnB allows users to create an account and host their space. Users can also request to book spaces for particular date/s. 

## How to Use

- Clone this repo to your local machine.
- Then, run 'bundle install' to install the required gems.
- After, follow the instructions in 'db/migrations' to setup the database.
- To run the program, run 'rackup' in your terminal and visit 'localhost:9292'.

- You can sign up and create an account which enables you to host a space
- If you prefer not to sign up, you can view all available spaces by visiting 'localhost:9292/spaces/show'.

## Running tests

`test_command` (e.g. `rspec`)

## User Stories

``` 
As a potential user
So that i can use the app as a host or a guest,
I want to sign up for MakersBnB

As a host
So that I can list places as me
I want to log in to MakersBnB

As a host
So that I can avoid others listing and accepting requests as me
I want to log out to MakersBnB

As a host,
so that people know what they're going to get,
I want to provide a short description of the place.

As a host
So that I can control how much to charge
I want to include a price per night

As a host
So that my space is easily identifiable, I want to add a name to my space.
I want to add a name on my space

As a Host,
So that I can offer more than one space,
I would like to be able to list multiple places

As a host, 
So that I can be efficient,
I would like to add multiple available dates at once

As a Host,
So that renters know when the place is rentable,
I would like to include the dates the place is available
```

----------------------------------------------

## Screenshots

## User Stories to be added

```
As a host
So that I have control of who rents my place
I want to be able to approve (or decline) a request for a booking

As a user,
so that I have a place to stay,
I want to request a space to hire for one night.

As a Host,
So that my place will not be double booked,
I would like the place to not be available to be booked on that date once a request has been approved on that date.

As a host,
so that i have more options on who can book my place,
I would my place to be available until i can approve the request
```

```
*                 )       (    (               )        
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

At the barest minimum, it should contain a description of what the code does, how to install it, how to use it and how to run its tests. In addition, READMEs often include other information such as:

- Configuration instructions
- A file manifest (list of files included)
- Copyright and licensing information
- Contact information for the distributor or programmer
- Known bugs
- Troubleshooting
- Credits and acknowledgments
- A changelog (usually for programmers)
- A news section (usually for users)

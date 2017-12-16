[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# User Manager

This repository contains a simple demo API built with NodeJS.
The API is used to manage users in a MongoDB database.

### Development
This application was developed using [ExpressJS](http://expressjs.com/). MongoDB was used for persisting data with [Mongoose](https://mongoosejs.com/) as [ORM](https://en.wikipedia.org/wiki/Object-relational_mapping).

### Installation
``` Ensure you have docker installed.```
* Clone or download at https://github.com/adesege/UserManager.git
* Then `cd UserManager`.
* Rename or create a copy of `.env.sample` file in your root directory.
* From your `cmd` in your application working directory, run `docker-compose up`

#### Environment variables
A few things to note about environment varibales.

ENV | Default | Note
--- | ------- | -----------------
`DB_URL` | mongodb://usermanager:password@mongo:27017/UserManager | |
`MONGODB_ADMIN_USERNAME` and `MONGODB_ADMIN_PASSWORD`| `root` and `password` respectively | Used for setting the credentials for the root priviledge
`MONGODB_APP_USERNAME` and `MONGODB_APP_PASSWORD`| `usermanager` and `password` respectively |  Used for setting the credentials for the application database |
`MONGODB_APP_DB` | UserManager | Application Database name |

### Testing
To ensure that your installation is successful you'll need to run tests.
The command: `docker-compose exec node npm test` makes this possible. It isn't functional right now, but once it's done you'll be notified via the README.

### API Documentation
The API only has one endpoint which is the `/users` endpoint for saving users to the database. The endpoint works with the HTTP verbs: `POST`, `GET`, `PUT`, `DELETE`.

###### POST HTTP Request
-   `POST` /users
-   INPUT:
```x-form-url-encoded
name: John Doe
email: john.doe@gmail.com
password: johndoe
```

###### HTTP Response

-   HTTP Status: `201: created`
-   JSON data
```json
{
  "_id": "59071791b0lkscm2325794",
  "name": "John Doe",
  "email": "john.doe@gmail.com",
  "password": "johndoe",
  "__v": 0
}
```

###### GET HTTP Response
-   `GET` /users

```json
[
    {
        "_id": "59071791b0lkscm2325794",
        "name": "John Doe",
        "email": "john.doe@gmail.com",
        "password": "johndoe",
        "__v": 0
    }
]
```

###### GET HTTP Response
-   `GET` /users/:id

```json
{
    "_id": "59071791b0lkscm2325794",
    "name": "John Doe",
    "email": "john.doe@gmail.com",
    "password": "johndoe",
    "__v": 0
}
```

###### DELETE HTTP Response
-   `DELETE` /users/:id

```json
User John Doe was deleted
```

###### POST HTTP Request
-   `PUT` /users/:id
-   INPUT:
```x-form-url-encoded
name: Jane Doe
email: jane.doe@gmail.com
password: janedoe
```

###### HTTP Response

-   HTTP Status: `200: OK`
-   JSON data
```json
{
  "_id": "59071791b0lkscm2325794",
  "name": "Jane Doe",
  "email": "jane.doe@gmail.com",
  "password": "janedoe",
  "__v": 0
}
```



### Author
**Olajide Bolaji 'Nuel** - Software Developer at Andela

### Thanks to
- [**Temitayo Fadojutimi**](http://about.me/fadojutimitemitayo) - He tweets [@adesege_](http://twitter.com/adesege_)

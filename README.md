# Georgia Ethics API

This will be an API frontend to campaign ethics information published by the State of Georgia.
It's still a work in progress but we hope that you'll join us in our effort to make it a
reality.

## Running locally

Once you have a clone of this repository locally, navigate to the folder the project was cloned
to and run `bin/www`. Like so:

```
$ bin/www
```

That will start up the Express and load up a placeholder index page. From there you should
be able to navigate to any URL that is currently defined in the application.

## Project structure

There are a few notable folders at the root level that you should be aware of.

- **api**: This folder is the root of the API controllers.
  - **api/v1**: This is where the current version of the API lives.
- **bin**: This folder is managed by Express. Please don't go dropping things in it.
- **public**: Any static assets for the site (e.g. stylesheets) go here. There
  shouldn't be that many since this is primarily an API.
- **routes**: This is where controllers for human-focused pages will go.
  (e.g. the homepage)
- **views**: Templates and views to be rendered for the hompage.

## API Endpoints

The following API Endpoints will eventually be implemented.

* GET /api/v1/candidates/search
  * Search for a particular candidate
* GET /api/v1/candidates/:id
  * Retrieve a particular candidate
* GET /api/v1/candidates/:id/campaigns
  * Retrieve campaigns run by a particular candidate
* GET /api/v1/campaigns/:id
  * Retrieve a particular campaign.
* GET /api/v1/campaigns/:id/reports/:reportid
  * Retrieve a particular campaign report.
  
## License

This project is licensed under the terms of the Apache 2 License.

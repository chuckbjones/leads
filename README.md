# README

### The main components
* Rails 7
* Postgresql
* Hotwire
* Tailwind
* Rspec
* Devise
* Pundit
* Rolify

### Implemention

Three primary data models:
* User - provides authentication via Devise, and authorization via Pundit/Rolify.
* Office - just a name and a state. Both Users and Customers are associated with an Office.
* Customer - the 'leads'. These are created via a form on the root page. They are automatically associated to an Office based on state on first save.


UI:
* Only 1 significant screen was implemented. the root page (actually `customers#new`) displays a form for creating new Customer models. Basic input validation is handled through the standard ActiveModel Validations. I didn't do add anything to prevent duplicate entries, which would be important yet challenging in the real world. (I could just add a unique connstraint on the db table, but that would lead to poor user experience.)
* Upon submit, the customer is shown the details of their assigned Office. I used a Hotwire turbo-frame to swap out the form with the office model's show view. It was pretty quick and dirty though, so it's not the cleanest it could be.
* Log in/Log out links were added, but the implementation is pure Devise. And I didn't add any other pages that would require the authenticated user anyway.
* Stubs for the remaining pages are in the source, but they don't do anything interesting.

### Running in development

Run `bin/dev` to start up puma, build assets, and watch for changes.

```bash
> ./bin/dev
```

The app can then be accessed at `http://localhost:3000`.

### Testing

rspec is setup to un all of the unit/functional tests out of the gate:
```bash
> rspec
```

### Bootstrap some data
The following will load some dummy users and a few Office models into the dev database:

```bash
> SEED_PASSWORD=something rake db:seed`
```

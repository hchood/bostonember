## Overview

Following along with [Dockyard's](http://dockyard.com/) tutorial on building an [ember-cli](https://github.com/ember-cli/ember-cli) app with a Rails backend:

* [Part 1](http://reefpoints.dockyard.com/2014/05/07/building-an-ember-app-with-rails-part-1.html)

  - NOTE: ember-cli initializes a git repo for you. You'll need to remove it and create a git repo in your top-level directory.  The tutorial doesn't mention this.

* [Part 2](http://reefpoints.dockyard.com/2014/05/08/building-an-ember-app-with-rails-part-2.html)
  - NOTES:  
    * Don't need to add the line to `ember/tests/helpers/start-app.js` - a PR to fix that bug has been merged in.
    * Don't need to import Ember twice in the test.

* [Part 3](http://reefpoints.dockyard.com/2014/05/09/building-an-ember-app-with-rails-part-3.html)
  - NOTES:  
    * Need to import ember in the about-page and speakers-page tests:  
      ```javascript
      import Ember from 'ember';
      ```
    * Need to add `ember-cli-pretender` addon and import for speakers page test:
      ```no-highlight
      $ ember install:addon ember-cli-pretender
      ```

      ```javascript
      import Pretender from 'pretender';
      ```
    * Type in creating the index.hbs: missing the `app/` part in the path to the index page

    * Need to use active_model_serializers v. 0.8.3 with Rails 4.2

* [Part 4](http://reefpoints.dockyard.com/2014/05/31/building-an-ember-app-with-rails-part-4.html)
  - NOTES:
    * Typo: "Modifying our existing Speaker model to add to relationship..."
    * Typo: serializers should be named `presentation_serializer.rb` for ex.

# Steps to get ember-data parts working

## Ember side

### 1. Link to speakers index page

* A link:
  ```javascript
  // frontend/templates/application.hbs
  {{link-to 'Speakers' 'speakers'}}
  ```
* A path in the router to that link:
  ```javascript
  // frontend/app/router.js
  Router.map(function() {
    this.route('about');

    // add a route, for speakers index
    this.resource('speakers');
  });
  ```
* A corresponding template, with an outlet where the individual speaker templates will be rendered:
  ```javascript
  // frontend/app/templates/speakers.hbs
  <h3>Speakers</h3>

  {{outlet}}
  ```

### 2. Add links to speakers show pages on index page

* A path in the router:
  ```javascript
  // frontend/app/router.js
  Router.map(function() {
    this.route('about');

    // add a route, for speakers show page
    this.resource('speakers', function() {
      this.route('show', { path: ':speaker_id' });
    });
  });
  ```
* A model:
  ```javascript
  // frontend/app/models/speaker.js
  import DS from 'ember-data';

  export default DS.Model.extend({
    name: DS.attr('string')
  });
  ```

* A route:
  ```javascript
  // frontend/app/routes/speakers/index.js
  import Ember from 'ember';

  export default Ember.Route.extend({
    model: function() {
      return this.store.find('speaker');
    }
  });
  ```

* A template:
  ```javascript
  // frontend/app/templates/speakers/index.hbs
  {{#each}}
    {{link-to name 'speakers.show' this}}
  {{/each}}
  ```

### 3. Add a speaker show page

* The link route, model, etc. already exist, so you can just add the template:

  ```javascript
  // ember/app/templates/speakers/show.hbs
  <h4>{{name}}</h4>
  ```

## Rails side

### 1. Generate the model

  ```no-highlight
  $ rails g model speaker name:string
  ```

#### Start

download project

create db:
```sh
$ cp config/database.yml.sample config/database.yml
$ rake db:create db:migrate
```

install gems
```sh
$ bundle install
```

fake data
```sh
$ rails c
$ FactoryGirl.create_list :service, 20
$ FactoryGirl.create :user
```

Getting api key to use google map:
- login to your google account
- go to [console](https://console.developers.google.com)
- Create project
- Turn on API
- Click on Google Maps JavaScript API
- Click Turn on
- Also turn on Google Maps Geocoding API
- Create credidentials to use this api
- Copy key like 'gsf324fdf4' and paste it to secrets.yml

Run server
```sh
$ rails s
```

- sign in
- create/update/destroy tasks

#### OR

- Go to [heroku](https://salty-falls-29316.herokuapp.com/)

- Sign in / Sign up

- Enjoy

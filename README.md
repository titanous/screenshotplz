# screenshotplz

A simple web service for making PNGs out of URLs. Requires Ruby 1.9 and
phantomjs.


## Local usage

```sh
bundle install
thin start
```

```
GET /300x300/www.nytimes.com

HTTP/1.1 302 Moved Temporarily
Location: http://localhost:3000/9c4729df7221e94c0f501a49a479e482b719d335.png
```

```
GET /weather/ottawa

HTTP/1.1 302 Moved Temporarily
Location: http://localhost:3000/9c4729df7221e94c0f501a49a479e482b719d335.png
```

## Heroku

```sh
heroku apps:create --stack cedar --buildpack https://github.com/ddollar/heroku-buildpack-multi.git
git push heroku master
heroku config:add GEM_PATH=vendor/bundle/ruby/1.9.1 LD_LIBRARY_PATH=/usr/local/lib:/usr/lib:/lib:/app/vendor/phantomjs/lib PATH=bin:vendor/bundle/ruby/1.9.1/bin:/usr/local/bin:/usr/bin:/bin:/app/vendor/phantomjs/bin RACK_ENV=production
```

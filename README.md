# Hot Reads

Hot Reads is a small app that reads the top ten links from the Url Lockbox app in the last 24 hours and displays them ranked by read count.

### Setup:
Follow setup instructions for [UrlLockbox](https://github.com/annadolan/temp-mid-mod-1/tree/final)

Clone: `git clone https://github.com/annadolan/final-hot-reads.git`

Install dependencies: `bundle install`

Set up database: `rake db:create db:migrate`

Run locally: `rails s -3001`

#### API

This app includes an API to add links and to serve the top ten links to UrlLockbox. The endpoints are as follows:

`POST /api/v1/links` - creates a new link. Request format: `{ link: { url: url } }`

`GET /api/v1/links/` - returns top ten links, ranked by number of reads.

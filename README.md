# InContact API

A gem for the InContact API


## Installation

### Bundler
Add the gem to your Gemfile:
```ruby
gem 'incontact_api'
```
### Manually

```ruby
gem install incontact_api
```
## Environment Variables

Define the following as enviroment variables.

UCN_URL

UCN_KEY

GRANT_TYPE

USERNAME

PASSWORD

SCOPE

If you are using rails you could use the [Figaro](https://github.com/laserlemon/figaro) gem to handle setting up environment variables.


### Variable Definitions

UCN_URL: This is the base url 'https://api.incontact.com'
UCN_KEY: This is a key that is made up of Application Name@Vendor Name:Business # EX. 'MyApp@MyCompany:12345'
GRANT_TYPE: This variable is based on the types of API you request. More info can be found below in the link
USERNAME: The username to use to access the API.  User must have permissions to create API Applications
PASSWORD: The password for the above username.
SCOPE: The list of API's you want to access.  Format to a string for example "Admin Chat RealTime"

[Link to InContacts API](https://home-c4.incontact.com/InContact/Help/en-US/index.htm#docs)

## Usage

Returns list of agents

```ruby
require 'incontact_api'

InContactApi::Connection.base.get "/inContactAPI/services/v2.0/agents"
```

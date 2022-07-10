# C-PACE

## Installation

### Rails Server

```bash
bundle install
rails webpacker:install
rake db:create db:migrate
source .corelogic-keys
```

### Generating password instructions
```ruby
raw, hashed = Devise.token_generator.generate(User, :reset_password_token)
user = User.find_by(email: 'john.doe@mysaas.com')
user.reset_password_token = hashed
user.reset_password_sent_at = Time.now.utc
user.save

# Use URL - /users/password/edit?reset_password_token=raw
```

## Running the application

### Rails
```bash
rails s -b 0.0.0.0 -p 3000
```

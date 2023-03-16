# CONTACT IMPORTER

This project is to upload a csv file and save selecting the column for each row

### Prerequisites

Ruby version: 2.7.7
Database: PostgreSQL
Node version: v16.14.2

## Installing Ruby for Mac

For more information to install the project in Ubuntu or Windows, you can go to (https://gorails.com/)[https://gorails.com/setup/macos/13-ventura]

```
    cd
    git clone https://github.com/excid3/asdf.git ~/.asdf
    echo '. "$HOME/.asdf/asdf.sh"' >> ~/.zshrc
    echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.zshrc
    exec $SHELL
```

Then installing ruby and node

```
    asdf plugin add ruby
    asdf plugin add nodejs
```

```
    asdf install ruby 2.7.7
    asdf global ruby 2.7.7
```

```
    asdf install nodejs 16.14.2
    asdf global nodejs 16.14.2

    which node
    #=> /Users/username/.asdf/shims/node
    node -v
    #=> 16.14.2

    # Install yarn for Rails jsbundling/cssbundling or webpacker
    npm install -g yarn
```

Install the database

```
brew install postgresql
brew services start postgresql
```


Install the bundler

```
    gem install bundler 2.3.8
```

Then install all gems

```
bundle install
```

Make a copy for the env.example to .env and generate a secret key for encrypt

```
    SecureRandom.hex(32)
```

When this is done, we can setup the data


```
rails db:create
rails db:migrate
rails db:seed
```

Then run the project

```
rails s
# or 
bundle exec rails s
```

You can use an example file [example_file](example_file.csv)

## Testing

```
rspec spec
# or
bundle exec rspec spec
```

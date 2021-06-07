# Tabstore
Tool for importing sales from plain-text tables.

## Setup
```bash
git clone https://github.com/pandrRe/tabstore.git //or unzip from tarball
cd tabstore
bundle install
yarn install
bin/rails db:setup
```

## Running
```bash
bin/rails server
```
Open on localhost:3000.

## Testing

```bash
bin/rails test
```

## Manual Test Flow

1. You should be greeted with a login screen. The system is limited to logged-in users.
2. The "Sign up" button should take you to a registration screen.
3. Username and password are needed for registration.
4. After registering, you are automatically logged in and taken to the main screen.
5. Here you have a table with all purchases and gross income numbers.
6. Press Import Purchases to be taken to a new screen where you can upload a file.
7. The file will be parsed and the purchases are added to the database.
8. You will be redirected to the main screen.
9. You can log out in the main screen.

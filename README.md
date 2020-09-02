# ReciMe 

ReciMe is a Ruby app for showcasing chefs portfolios

## Installation
```bash
bundle install
rake db:migrate
rake db:seed
```

## Usage

```ruby
shotgun
go to localhost:9393

Sign up to Recime on the homepage with username/email, profile picture, bio and password.

Log In with your username/email and password.

See all posts from all users on the "All Posts" section.

Create a post by clicking on the "Create Post" link and following the steps. You will be asked for a title, and ImageUrl and a description to post your post. Click create new post and it is persisted to the database.

A user can edit and delete their own posts only and they can do so by clicking on the "Edit Post" link or the "Delete Post!" button. If a user tries to edit or delete a post that does not belong to them an error message is shown.

Users can Like and Unlike posts, both their own and that of other users. The user can only unlike something if they have previously liked it, the user cannot like a post more than once.

Log Out by clicking on the "Log out" link in the navbar the top of all the pages.
```

## Contributing
Pull requests are welcome. For major changes, please open an issue firstt to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)

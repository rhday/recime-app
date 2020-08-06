require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

## for patch and delete requests

#this is needed to send PATCH and DELETE requests
use Rack::MethodOverride

#mount controllers here:

use LikesController

use PostsController

use UsersController

run ApplicationController

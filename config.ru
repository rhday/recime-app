require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

## for patch and delete requests

use Rack::MethodOverride

use PostsController

use UsersController

run ApplicationController

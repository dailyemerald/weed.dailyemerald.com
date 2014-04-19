echo "Creating backup ..."
heroku pgbackups:capture --expire

echo " ----- "
echo "Downloading backup ..."
curl -o ./prod_db/`date +%Y-%m-%d`-production-sql.dump `heroku pgbackups:url`

echo " ----- "
echo "rake db:reset ..."
bundle exec rake db:reset

echo " ----- "
echo "Restoring backup to weed_development"
pg_restore --verbose --clean --no-acl --no-owner -h localhost -U `whoami` -d weed_development ./prod_db/`date +%Y-%m-%d`-production-sql.dump

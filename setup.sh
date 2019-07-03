# echo "starting setup..."
# brew install postgres && brew services start postgresql > /dev/null
# echo "setup complete"

echo "dropping database..."
dropdb e29_social_club
echo "creating database..."
createdb e29_social_club

echo "setting up tables..."
psql -d e29_social_club -f db/e29_social_club.sql

echo "seeding database with some data..."
ruby db/seeds.rb

# Create the server and start it
docker compose -f compose.dev.yml down -v
docker compose -f compose.dev.yml up -d --build
docker image prune -a --noinput

# Apply database migrations, collect and clear static files:
docker compose -f compose.dev.yml exec web python manage.py migrate --noinput
docker compose -f compose.dev.yml exec web python manage.py collectstatic --no-input --clear
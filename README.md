## Ports
Dev: `8080`
Prod: `80`
## Setup ENV Variables

Review values in `.env.dev`, `.env.prod`, `.env.prod-db`. Be sure to change sensitive variables for your project.

## Setting up a Virtual Environment

To set up a virtual environment for this project, navigate to the `app` directory and run the following commands:

```bash
cd app
python3 -m venv env
source env/bin/activate
pip install django
cd ..
```

Don't forget to reconnect using `source env/bin/activate` when reopening the project!

## How to prep for development

Shut down the containers and remove the volumes, build and start the containers in development mode:

```bash
# Create the server and start it
docker compose -f compose.dev.yml down -v
docker compose -f compose.dev.yml up -d --build
docker image prune -a

# Apply database migrations, collect and clear static files:
docker compose -f compose.dev.yml exec web python manage.py migrate --noinput
docker compose -f compose.dev.yml exec web python manage.py collectstatic --no-input --clear

# Set super admin user
docker compose -f compose.dev.yml exec web python manage.py createsuperuser
```

## How to prep for production

Shut down the containers and remove the volumes, build and start the containers in development mode:

```bash
# Create the server and start it
docker compose -f compose.prod.yml down -v
docker compose -f compose.prod.yml up -d --build
docker image prune -a

# Apply database migrations, collect and clear static files:
docker compose -f compose.prod.yml exec web python manage.py migrate --noinput
docker compose -f compose.prod.yml exec web python manage.py collectstatic --no-input --clear

# Set super admin user
docker compose -f compose.prod.yml exec web python manage.py createsuperuser
```
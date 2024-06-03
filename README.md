
## Setting Up a Virtual Environment

To set up a virtual environment for this project, navigate to the `app` directory and run the following commands:

```bash
cd app
python3 -m venv env
source env/bin/activate
```

## How to prep for production

Shut down the containers and remove the volumes, build and start the containers in development mode:
```bash
docker-compose -f docker-compose.prod.yml down -v
docker-compose -f docker-compose.prod.yml up -d --build
```

## How to prep for development

Shut down the containers and remove the volumes, build and start the containers in development mode:
```bash
docker-compose -f docker-compose.yml down -v
docker-compose -f docker-compose.yml up -d --build
```

## How to start and prep the server after changes

Apply database migrations, collect and clear static files:
```bash
docker-compose -f docker-compose.yml exec web python manage.py migrate --noinput
docker-compose -f docker-compose.yml exec web python manage.py collectstatic --no-input --clear
```

## How set the website /admin super user

Set super admin user:
```bash
docker-compose -f docker-compose.prod.yml exec web python manage.py createsuperuser
```
FROM python:3.8-slim-buster

WORKDIR /usr/src/app

ENV PYTHONUNBUFFERED=1

ENV PYTHONDONTWEITEBYTECODE=1

COPY Pipfile* ./

RUN pip install --upgrade pip pipenv

RUN pipenv install --system --ignore-pipfile

COPY . .

RUN pip install -r requirements.txt

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
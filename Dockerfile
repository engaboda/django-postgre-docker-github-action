FROM python:3.6.7-slim AS development

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
WORKDIR /code

# RUN sudo apt-get update \
    # && sudo apt install postgresql-dev gcc python3-dev musl-dev

RUN pip install --upgrade pip
COPY requirements.txt /code/
RUN pip install -r requirements.txt


# COPY ./entrypoint.sh
# RUN sed -i 's/\r$//g' ./code/entrypoint.sh
# RUN chmod +x /code/entrypoint.sh

COPY . /code/

EXPOSE 8000

# ENTRYPOINT ["/code/entrypoint.sh"]
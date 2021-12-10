# syntax=docker/dockerfile:1

FROM python:3

RUN apt-get update
RUN apt-get install -y --no-install-recommends

# for flask web server
EXPOSE 8081

WORKDIR /src

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . /src

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
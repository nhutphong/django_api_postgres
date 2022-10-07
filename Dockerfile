FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code

# COPY nhieu files dung / thay cho dot= .
COPY Pipfile Pipfile.lock /
RUN python3 -m pip install --user --upgrade pip
RUN pip3 install pipenv && pipenv install --dev --system --deploy --ignore-pipfile

COPY ./entrypoint.sh .
RUN chmod 755 entrypoint.sh
# phai co WORKDIR = /code/ phia truoc
ENTRYPOINT ["sh", "/code/entrypoint.sh"]

#port container
EXPOSE 8000

COPY . .
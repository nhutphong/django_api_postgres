FROM python:3
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code

ADD requirements.txt /code/
RUN pip3 install -r requirements.txt


COPY ./entrypoint.sh .
RUN chmod 755 entrypoint.sh
# phai co WORKDIR = /code/ phia truoc
ENTRYPOINT ["sh", "/code/entrypoint.sh"]

#port container
EXPOSE 8000

COPY . .
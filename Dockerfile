FROM python:3.6.5-alpine3.7

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN apk update

RUN apk add nodejs

RUN npm install

RUN npm run build

EXPOSE 5000

CMD [ "python", "./app.py" ]

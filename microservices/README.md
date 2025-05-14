# Microservices

The Dont Give Up quote app started with a monolithic app - all bundled together. This is to break it down to microservices so that each service does a paticular job.
 
Here is the directory structure.
```
/microservices-app/
│
├── auth-service/
│   ├── app.py
│   ├── model.py
│   ├── auth.py
│   └── requirements.txt
│
├── quotes-service/
│   ├── app.py
│   ├── quotes.py
│   └── requirements.txt
│
├── frontend-service/
│   ├─ templates/
│   ├── static/
│   ├── app.py
│   └── requirements.txt
│
├── docker-compose.yml
├── gateway/ (optional)
│   └── nginx.conf
```


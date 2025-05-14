# Test Locally

Check if the quote is being served correctly.

```
docker build -t quotes-service .
docker run -p 5001:5001 quotes-service
```

Check http://localhost:5001/quote

Note: Remember the output will be in json

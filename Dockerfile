FROM python:3.7-slim 
RUN pip install flask 
WORKDIR /app 
COPY app.py /app/app.py
ENTRYPOINT ["python"]
EXPOSE 8080 
CMD ["/app/app.py"]
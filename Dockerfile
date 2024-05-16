FROM python:3.10-slim

EXPOSE 8080
WORKDIR /app

# Install any needed dependencies specified in requirements.txt
RUN pip install -r requirements.txt


# Install playwright and then its dependencies (the browsers)
RUN pip install playwright
RUN playwright install
RUN playwright install-deps


ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8080", "--server.address=0.0.0.0"]
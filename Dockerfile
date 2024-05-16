FROM python:3.8

EXPOSE 8080
WORKDIR /app

COPY . ./
# Install any needed dependencies specified in requirements.txt
RUN pip install --nocache-dir -r requirements.txt


# Install playwright and then its dependencies (the browsers)
RUN pip install playwright
RUN playwright install
RUN playwright install-deps


ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8080", "--server.address=0.0.0.0"]
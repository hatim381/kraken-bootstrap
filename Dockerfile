FROM python:3.12-slim
RUN useradd --create-home --uid 1000 app
WORKDIR /app
RUN chown app:app /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY --chown=app:app app/ app/
COPY --chown=app:app data/ data/
ENV OUTPUT_DIR=output
USER app
CMD ["python", "-m", "app.main"]

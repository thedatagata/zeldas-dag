
FROM python:3.9.1

ENV VIRTUAL_ENV=/opt/venv
ENV DAGSTER_HOME=/opt/zeldas_pipeline
ENV POETRY_HOME=/opt/poetry

RUN python -m venv "$VIRTUAL_ENV" && \
    mkdir -p "$DAGSTER_HOME"

ENV PATH="$VIRTUAL_ENV/bin:$POETRY_HOME/bin:$PATH"

COPY poetry.lock pyproject.toml /
RUN pip install --upgrade pip 
RUN pip install poetry 
RUN poetry config virtualenvs.path "$VIRTUAL_ENV" 
RUN poetry install --no-root --no-interaction --no-ansi --no-dev

COPY . "$DAGSTER_HOME"

EXPOSE 3000
WORKDIR $DAGSTER_HOME
CMD ["dagster", "dev", "-h", "0.0.0.0", "-p", "3000"]
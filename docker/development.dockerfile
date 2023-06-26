FROM crystallang/crystal:1.8.2

# Install utilities required to make this Dockerfile run
RUN apt-get update && \
    apt-get install -y wget

# Apt installs:
# - Postgres cli tools are required for lucky-cli.
# - tmux is required for the Overmind process manager.
RUN apt-get update && \
    apt-get install -y postgresql-client tmux && \
    rm -rf /var/lib/apt/lists/*

# Install lucky cli
WORKDIR /lucky/cli
RUN git clone https://github.com/luckyframework/lucky_cli . && \
    git checkout v1.0.0 && \
    shards build --without-development && \
    cp bin/lucky /usr/bin

WORKDIR /app
COPY . /app

# Set the environment variable for the DATABASE_URL
ENV DATABASE_URL="postgresql://postgres:postgres@host.docker.internal:5432/postgres"

CMD ["lucky", "db.setup"]
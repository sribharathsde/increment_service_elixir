
# Increment Service

This is a scalable web service built using Elixir and Phoenix framework that allows incrementing key-value pairs and storing them temporarily in memory before syncing the state with a PostgreSQL database every 10 seconds.

## Prerequisites

### Running the Project Without Docker

1. **Elixir**: Version 1.11 or later
    - Installation instructions: https://elixir-lang.org/install.html
    - On macOS (with Homebrew):
        ```bash
        brew install elixir
        ```
    - On Ubuntu/Debian:
        ```bash
        sudo apt-get update
        sudo apt-get install elixir
        ```

2. **Phoenix Framework**:
    - Install the Phoenix framework by installing the Phoenix project generator.
    ```bash
    mix archive.install hex phx_new
    ```

3. **PostgreSQL**:
    - Ensure PostgreSQL is installed and running. You can install it from https://www.postgresql.org/download/.
    - On macOS (with Homebrew):
        ```bash
        brew install postgresql
        brew services start postgresql
        ```
    - On Ubuntu/Debian:
        ```bash
        sudo apt-get update
        sudo apt-get install postgresql postgresql-contrib
        sudo service postgresql start
        ```

4. **Node.js** (optional, only if you need front-end assets):
    - Phoenix uses Node.js to compile static assets.
    - Download from: https://nodejs.org/en/download/
    - On macOS:
        ```bash
        brew install node
        ```

### Running the Project With Docker

Using Docker and Docker Compose simplifies the setup because everything (Elixir, Phoenix, PostgreSQL) runs inside containers. All you need is Docker installed.

1. **Docker**:
    - Download and install Docker: https://www.docker.com/get-started
    - On macOS or Windows, install **Docker Desktop**.
    - On Ubuntu/Debian:
        ```bash
        sudo apt-get update
        sudo apt-get install docker-ce docker-ce-cli containerd.io
        ```

2. **Docker Compose**:
    - Docker Compose allows you to define and run multi-container Docker applications.
    - On macOS or Windows, Docker Desktop includes Docker Compose by default.
    - On Ubuntu/Debian:
        ```bash
        sudo apt-get install docker-compose
        ```

### Installation Instructions

#### Running Without Docker (Natively)

1. **Clone the repository (or unzip the downloaded project)**:
    ```bash
    git clone <repo_url>
    cd increment_service
    ```

2. **Install dependencies**:
    ```bash
    mix deps.get
    ```

3. **Set up the PostgreSQL database**:
    - Ensure PostgreSQL is running.
    - Modify `config/dev.exs` with your PostgreSQL credentials if needed.
    - Create and migrate the database:
        ```bash
        mix ecto.create
        mix ecto.migrate
        ```

4. **Start the Phoenix server**:
    ```bash
    mix phx.server
    ```

5. **Access the application**:
    The application will be available at [http://localhost:3333](http://localhost:3333).

#### Running With Docker

1. **Clone the repository (or unzip the downloaded project)**:
    ```bash
    git clone <repo_url>
    cd increment_service
    ```

2. **Build the Docker containers**:
    ```bash
    docker-compose build
    ```

3. **Start the containers**:
    ```bash
    docker-compose up
    ```

4. **Access the application**:
    The application will be available at [http://localhost:3333](http://localhost:3333).

### Testing the API

To test the API, you can use Postman or curl. Here is an example request:

#### POST /increment

- **URL**: `http://localhost:3333/increment`
- **Method**: POST
- **Body** (JSON):
    ```json
    {
      "key": "some_key",
      "value": 5
    }
    ```

The server will respond with HTTP status code `202 (Accepted)`.

### Running Tests

To run the tests, execute:

```bash
mix test
```
    
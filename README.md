# Atlas Inspect

This repository contains resources and scripts for exploring and inspecting database schemas using [Atlas](https://atlasgo.io/) with PostgreSQL. The project demonstrates the use of `atlas schema inspect` to view schema structures in various formats, including HCL, SQL, JSON, and an interactive visual browser.

## Project Setup

### Prerequisites

1. **Docker**: Ensure Docker is installed and running to host the PostgreSQL database container.
2. **Atlas CLI**: Install the Atlas CLI, which you can download [here](https://atlasgo.io/cli).

### Clone the Repository

```bash
git clone https://github.com/peretzrickett/atlasinspect.git
cd atlasinspect
```

## Database Setup

1. **Start PostgreSQL in Docker**:
   - Use Docker Compose to set up a PostgreSQL container. The `docker-compose.yml` file is configured with the necessary environment variables and mounts an initial schema.

   ```bash
   docker-compose up -d
   ```

2. **Verify the Database**:
   - Connect to the PostgreSQL container:

     ```bash
     docker exec -it atlasinspect-postgres-1 psql -U atlasuser -d atlasdb
     ```
   - Run `\dt company.*` to check the tables within the `company` schema.

## Inspecting the Schema

This project includes scripts to inspect the schema in different formats using Atlas.

### Commands

- **HCL Format**:

  ```bash
  atlas schema inspect --url "postgres://atlasuser:atlaspass@localhost:5432/atlasdb?sslmode=disable" > schema.hcl
  ```

- **SQL Format**:

  ```bash
  atlas schema inspect --url "postgres://atlasuser:atlaspass@localhost:5432/atlasdb?sslmode=disable" --format '{{ sql . }}' > schema.sql
  ```

- **JSON Format**:

  ```bash
  atlas schema inspect --url "postgres://atlasuser:atlaspass@localhost:5432/atlasdb?sslmode=disable" --format json > schema.json
  ```

- **Visual Browser View**:

  To open an interactive visualization in your web browser, use the `-w` flag:

  ```bash
  atlas schema inspect --url "postgres://atlasuser:atlaspass@localhost:5432/atlasdb?sslmode=disable" -w
  ```

This will open a visual representation of your schema, allowing for interactive exploration.

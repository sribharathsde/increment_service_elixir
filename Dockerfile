
# Use the official Elixir image
FROM elixir:1.11

# Install Hex + Rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Set up working directory
WORKDIR /app

# Copy the necessary files
COPY . .

# Install dependencies
RUN mix deps.get

# Precompile the application
RUN MIX_ENV=dev mix compile

# Expose the port the Phoenix app runs on
EXPOSE 3333

# Run Phoenix server
CMD ["mix", "phx.server"]

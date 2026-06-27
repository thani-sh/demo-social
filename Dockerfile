# syntax=docker/dockerfile:1.7

# ---- builder: compile Bun app into a standalone binary ----
FROM oven/bun:1 AS builder
WORKDIR /app

# Install deps first so this layer caches independently of source changes.
COPY package.json bun.lock ./
RUN bun install --frozen-lockfile

# Build the rest and compile a single-file executable.
COPY . .
RUN bun build --compile --production index.ts --outfile /app/server

# ---- runtime: ship only the binary on distroless ----
FROM gcr.io/distroless/base-debian12
WORKDIR /app
COPY --from=builder /app/server /app/server

ENV PORT=6001
EXPOSE 6001

USER nonroot:nonroot
CMD ["/app/server"]
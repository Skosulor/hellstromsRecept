# Build stage - Hugo extended with recent version
FROM docker.io/hugomods/hugo:0.126.0 AS builder
WORKDIR /site
COPY . .
RUN hugo --minify

# Serve with minimal static file server (~3MB)
FROM docker.io/lipanski/docker-static-website:2.4.0
COPY --from=builder /site/public .
ENV PORT=3001
EXPOSE 3001

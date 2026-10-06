# Vietnam Vector Editor UI

This repository contains only the web-based map editing interface. The app API and its database, routing, tiles, themes, and icon storage remain in [`vietnam_vector`](https://github.com/dlbhoang/vietnam_vector).

## Run

Build and run the static UI gateway with the API service reachable at the configured upstream:

```sh
docker build -t vietnam-vector-ui .
docker run --rm -p 8080:80 -e API_UPSTREAM=http://api-host:3008 vietnam-vector-ui
```

Open `http://localhost:8080`. Nginx serves the editor pages and forwards their API, style, icon, and island-data requests to `API_UPSTREAM`. This keeps the browser same-origin and avoids exposing an API URL in the editor files.

Set `API_UPSTREAM` to the private or public origin of the API service. Configure the API's `ICON_ADMIN_TOKEN` separately; the token is entered in the editor and must never be included in this repository or UI container environment.

## Contents

- `theme-editor.html`: theme editor and POI icon administration UI.
- `style-editor.html`: map style editor.
- `index.html`: editor landing page.
- `nginx/`: reverse-proxy configuration for the API service.

# Vietnam Vector Editor UI

This repository contains the web map client and its editing tools. The app API and its database, routing, tiles, themes, and icon storage remain in [`vietnam_vector`](https://github.com/dlbhoang/vietnam_vector).

## Run

Build and run the static UI gateway with the API service reachable at the configured upstream:

```sh
docker build -t vietnam-vector-ui .
docker run --rm -p 8080:80 -e API_UPSTREAM=http://api-host:3008 vietnam-vector-ui
```

Open `http://localhost:8080`. Nginx serves the web UI and forwards API, style, tile, icon, and island-data requests to `API_UPSTREAM`. This keeps browser requests same-origin and avoids exposing the API URL in the UI files.

Set `API_UPSTREAM` to the private or public origin of the API service. Configure the API's `ICON_ADMIN_TOKEN` separately; the token is entered in the editor and must never be included in this repository or UI container environment.

## Contents

- `index.html`: web map client.
- `theme-editor.html`: theme editor and POI icon administration UI.
- `style-editor.html`: map style editor.
- `index.html`: editor landing page.
- `nginx/`: reverse-proxy configuration for the API service.

## Change log

- `fdbf1e0` — created the standalone editor UI repository with the theme editor, style editor, landing page, and Nginx gateway container.
- `056f3b8` — added the web map client and routed API-bound requests through the UI gateway.
- `1c397e4` — recorded the initial repository history and the ongoing change-log convention.

For each later commit, add a short entry here describing its user-visible or deployment change.

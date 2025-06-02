# verkstedt-case Application

Case Study for the Mid-Range / Senior Cloud Infrastructure Engineer (f/m/x) position application at verkstedt.  
Author: Krystsian Shevando

---

## Project Structure

```
.
app/               # Static HTML and nginx config files
Dockerfile         # Dockerfile for nginx container
README.md          # This file
```

---

## What’s Included

### Docker

- Based on `nginx:alpine`
- Custom static assets (`default.conf`, `index.html`, `50x.html`) are copied into the container
- Build locally:

  ```bash
  docker build -t yourusername/nginx-app:1.0.0 .
  ```

- Run locally:

  ```bash
  docker run -d -p 8080:80 yourusername/nginx-app:1.0.0
  ```

#### Potential Improvements:

- Use **multi-stage builds** to minimize image size and remove any unnecessary intermediate artifacts.
- Run the container as a **non-root user** to follow best practices around container security.
- Consider **setting strict permissions** on `/etc/nginx` and `/usr/share/nginx/html`.
- Optionally, **scan the image** with tools like Trivy or Grype in CI to detect vulnerabilities.
- Optionally, pin `nginx` image to a specific digest for reproducible builds.

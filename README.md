# Inception

![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=docker&logoColor=white) ![NGINX](https://img.shields.io/badge/NGINX-009639?style=flat-square&logo=nginx&logoColor=white) ![WordPress](https://img.shields.io/badge/WordPress-21759B?style=flat-square&logo=wordpress&logoColor=white) ![MariaDB](https://img.shields.io/badge/MariaDB-003545?style=flat-square&logo=mariadb&logoColor=white) ![42 Roma Luiss](https://img.shields.io/badge/42_Roma_Luiss-000000?style=flat-square&logo=42&logoColor=white)

A small infrastructure built with Docker Compose. Each service has its own container, built from a custom Dockerfile instead of a ready-made image.

```
          :443 (TLS 1.3)
  client ───────────▶ nginx ──fastcgi:9000──▶ wordpress (php-fpm) ──:3306──▶ mariadb
                        │                          │                          │
                        └──── wordpress_data ──────┘                     mariadb_data
```

- **nginx**: the only entry point, HTTPS only, TLS 1.3, self-signed certificate
- **wordpress**: php-fpm, installed and configured at startup with `wp-cli`
- **mariadb**: database and users created by an init script
- **Volumes** persist the WordPress files and the database on the host. The containers share a private bridge network and restart automatically.

## Run

```bash
# set your values in srcs/.env, then
make        # build and start
make down   # stop
```

---

<sub>Part of my 42 Roma Luiss curriculum · [more projects](https://github.com/Fbiondo00) · MIT License</sub>

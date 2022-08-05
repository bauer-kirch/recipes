# Bauer + Kirch EAP Application

This project is based on the EAP PHP Stack.

- [Prerequisites](https://eap.pages.lan.bauer-kirch.de/php/docs/guide/env-prerequisites.html)
- [Documentation](https://eap.pages.lan.bauer-kirch.de/php/docs/)

## Start application
```bash
docker/mkcert # only on first start
docker-compose up -d
```

After all containers are started successfully, you can access your awesome app in the browser:
- Application: [https://localhost/](https://localhost/)
- Mails: [https://localhost/mailhog/](https://localhost/mailhog/)
- Database: [https://localhost/adminer](https://localhost/adminer)

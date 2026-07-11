
# Event Manager

[![Java](https://img.shields.io/badge/Java-17-007396?style=for-the-badge&logo=java)](https://adoptium.net/)
[![Hibernate](https://img.shields.io/badge/Hibernate-5.6-59666C?style=for-the-badge&logo=hibernate)](https://hibernate.org/)
[![MySQL](https://img.shields.io/badge/MySQL-8-4479A1?style=for-the-badge&logo=mysql)](https://www.mysql.com/)
[![Maven](https://img.shields.io/badge/Maven-3.8-C71A36?style=for-the-badge&logo=apache-maven)](https://maven.apache.org/)
[![Tomcat](https://img.shields.io/badge/Tomcat-9-F8DC75?style=for-the-badge&logo=apache-tomcat)](https://tomcat.apache.org/)
[![Docker](https://img.shields.io/badge/Docker-20.10-2496ED?style=for-the-badge&logo=docker)](https://www.docker.com/)

---

## Overview

**Event Manager** is a Java EE web application for managing events, organizers, and participants. It is built using **Servlets**, **JSP**, **Hibernate/JPA**, and **MySQL**, and runs on Apache Tomcat. The application provides a clean, server‑rendered interface with a shared navigation bar and full CRUD operations on the underlying data model.

---

## Features

- Create, view, and update events (`Evenement`)
- Manage organizers (`Organisateur`)
- Manage participants (`Participant`) and their event registrations
- Server‑rendered JSP views with a common navigation bar

---

## Tech Stack

| Layer          | Technology                     |
|----------------|---------------------------------|
| Language       | Java 17                         |
| Web layer      | Servlets + JSP, JSTL 1.2        |
| Persistence    | Hibernate 5.6 (JPA)             |
| Database       | MySQL 8                         |
| Build tool     | Maven                           |
| App server     | Apache Tomcat 9                 |
| Container      | Docker / Docker Compose         |

---

## Project Structure
eventManager-master/
├── src/main/java/
│ ├── dao/ # Data access interfaces + Hibernate implementations
│ ├── entities/ # JPA entities: Evenement, Organisateur, Participant
│ └── web/ # Controleur servlet (front controller)
├── src/main/resources/META-INF/persistence.xml # JPA/Hibernate datasource config
├── src/main/webapp/ # JSP views, navbar, images
├── pom.xml
├── Dockerfile
└── docker-compose.yml

text

---

## Quick Start (Docker Compose)

The fastest way to run the full stack — Tomcat + MySQL — is with Docker Compose.

**Prerequisites:** [Docker](https://docs.docker.com/get-docker/) and Docker Compose.

```bash
docker compose up --build
This single command will:

Build the WAR file with Maven inside a build container

Start a MySQL 8 container and create the event database

Deploy the WAR to Tomcat, waiting for MySQL to be healthy first

Auto‑create the database tables on first boot (hibernate.hbm2ddl.auto=update)

Once it's up, open:

To stop everything:

bash
docker compose down
To stop and also remove the database volume:

bash
docker compose down -v
Manual Setup (without Docker)
Prerequisites: JDK 17+, Maven, MySQL 8, Apache Tomcat 9.

Create the database:

sql
CREATE DATABASE event;
By default the app connects as root with no password. If your MySQL setup differs, update src/main/resources/META-INF/persistence.xml:

xml
<property name="javax.persistence.jdbc.url" value="jdbc:mysql://localhost:3306/event" />
<property name="javax.persistence.jdbc.user" value="root" />
<property name="javax.persistence.jdbc.password" value="" />
Build the WAR:

bash
mvn clean package
Deploy: copy target/*.war into Tomcat's webapps/ directory (rename to ROOT.war to serve it from /), then start Tomcat.

Open the app:

text
Configuration Notes
Database schema is managed automatically by Hibernate (hibernate.hbm2ddl.auto=update). For production use, change this to validate or none and manage schema migrations separately.

SQL logging is enabled by default (hibernate.show_sql=true) — turn this off for production.

There is no index.jsp/index.html at the webapp root, so the entry point is /accueil.jsp, not /.

Troubleshooting
Issue	Fix
Communications link failure on startup	MySQL isn't ready yet — with Docker Compose this is handled by the healthcheck; if running manually, make sure MySQL is running before starting Tomcat.


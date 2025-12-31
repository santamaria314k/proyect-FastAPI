Prueba Técnica – FastAPI, PostgreSQL, JWT, Docker

Este proyecto es una API REST desarrollada con FastAPI, PostgreSQL, SQLAlchemy, autenticación JWT, Alembic y Docker Compose.

La aplicación incluye autenticación de usuarios, protección de rutas, migraciones de base de datos y un entorno completamente contenerizado para facilitar su ejecución y evaluación.

Tecnologías Utilizadas

Python 3.11

FastAPI

PostgreSQL

SQLAlchemy ORM

Alembic (migraciones de base de datos)

JWT (OAuth2 Password Bearer)

Docker

Docker Compose





 Evaluador
descarga una copia del proyecto:
git clone repo-url
ejecuta con Docker PostgreSQL y la API:
docker-compose up --build
ejecuta la migracion que esta en la carpeta [alembic/versions/nitial_migration.py]:
docker-compose exec api alembic upgrade head





Cómo Ejecutar el Proyecto

1. Clonar el repositorio
git clone <URL-REPOSITORIO>
cd prueba-tecnica

2. Levantar los contenedores
docker-compose up --build


Este comando inicia:

La API en FastAPI

La base de datos PostgreSQL

3. Ejecutar la migración inicial con Alembic

Generar la migración inicial:

docker-compose exec api alembic revision --autogenerate -m "initial migration"


Aplicar la migración:

docker-compose exec api alembic upgrade head

4. Verificar las tablas en PostgreSQL (opcional)

Acceder al contenedor de PostgreSQL:

docker-compose exec postgres psql -U postgres -d technical_test


Listar las tablas:

\dt


Tablas esperadas:

users

tasks

alembic_version

Documentación de la API

Una vez el proyecto esté en ejecución, se puede acceder a la documentación interactiva en:

http://localhost:8000/docs

Flujo de Uso y Autenticación
1. Intentar crear una tarea sin autenticación
POST /tasks


Respuesta esperada:

{
  "detail": "Not authenticated"
}


Código de estado HTTP: 401 Unauthorized

2. Crear un usuario
POST /users


Body de la petición:

{
  "username": "testuser",
  "password": "test123"
}

3. Iniciar sesión para obtener el token JWT
POST /auth/login


Body de la petición:

{
  "username": "testuser",
  "password": "test123"
}


Respuesta:

{
  "access_token": "JWT_TOKEN",
  "token_type": "bearer"
}

4. Autorizar en Swagger

Acceder a /docs

Hacer clic en Authorize

Ingresar:

Bearer JWT_TOKEN


Confirmar autorización

5. Consultar usuarios (opcional)
GET /users


Ejemplo de respuesta:

[
  {
    "id": 1,
    "username": "testuser"
  }
]

6. Uso del CRUD de Tareas (protegido)

Una vez autenticado, se puede acceder a los siguientes endpoints:

POST /tasks

GET /tasks

GET /tasks/{id}

PUT /tasks/{id}

DELETE /tasks/{id}

Todos los endpoints de tareas están protegidos y requieren un token JWT válido.

Reinicio del Entorno

Detener los contenedores:

docker-compose down


Reconstruir y levantar nuevamente:

docker-compose up --build


Reconstrucción limpia sin caché:

docker-compose build --no-cache
docker-compose up

Seguridad

Contraseñas almacenadas de forma segura con bcrypt

Autenticación JWT con expiración

Flujo OAuth2 Password Bearer

Protección total de las rutas de tareas

Validación del token y del usuario en cada request



Notas Finales
1 . probar las funciones de crear task que se negara el acceso al no tener token de acceso
2.crear usuario username y password 
3.loguearse enpoint (Auth) con el usuario y la contraseña registrados 
4.si se desea en el enpoint (users) se puede consultar los ids y usernames de los usuarios 
5.al aberte logueado ya cuaentas con un token y  puedes acceder a la CRUD de task 
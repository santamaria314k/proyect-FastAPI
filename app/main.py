from fastapi import FastAPI
from app.api import auth, user, task
from app.db.session import engine
from app.db.base import Base

import app.db.models 

Base.metadata.create_all(bind=engine)

app = FastAPI(title=" API - prueba tecnica")

app.include_router(auth.router)
app.include_router(user.router)
app.include_router(task.router)

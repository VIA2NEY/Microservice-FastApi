import datetime
# from xmlrpc.client import DateTime
from sqlalchemy import Column, Integer, String, DateTime
from sqlalchemy.sql.expression import text
from sqlalchemy.sql.sqltypes import TIMESTAMP

from .database import Base


class User(Base):
    __tablename__ = "users"
    id = Column(Integer, primary_key=True, nullable=False, index=True)
    email = Column(String, nullable=False, unique=True, index=True)
    password = Column(String, nullable=False)
    firstname = Column(String, nullable=False)
    lastname = Column(String, nullable=False)
    phone = Column(String, nullable=False)
    # created_at = Column(TIMESTAMP(timezone=True),
    #                     nullable=False, server_default=text('now()'))
    created_at = Column(DateTime, nullable=False, default=datetime.datetime.utcnow)

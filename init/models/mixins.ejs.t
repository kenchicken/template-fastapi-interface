---
to: <%= rootDirectory %>/backend/app/models/mixins.py
force: true
---
from sqlalchemy import Column, text, DateTime


class TimestampMixin(object):
    created_at = Column(DateTime, nullable=False,
                        server_default=text('current_timestamp'))
    updated_at = Column(DateTime, nullable=False,
                        server_default=text('current_timestamp'))

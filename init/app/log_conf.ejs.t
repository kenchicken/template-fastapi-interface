---
to: <%= rootDirectory %>/backend/app/log_conf.yaml
force: true
---
version: 1
disable_existing_loggers: False
formatters:
  default:
    # "()": uvicorn.logging.DefaultFormatter
    format: '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
  access:
    # "()": uvicorn.logging.AccessFormatter
    format: '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
handlers:
  default:
    formatter: default
    class: logging.StreamHandler
    stream: ext://sys.stderr
  access:
    formatter: access
    class: logging.StreamHandler
    stream: ext://sys.stdout
loggers:
  uvicorn.error:
    level: INFO
    handlers:
      - default
    propagate: no
  uvicorn.access:
    level: INFO
    handlers:
      - access
    propagate: no
root:
  level: DEBUG
  handlers:
    - default
  propagate: no
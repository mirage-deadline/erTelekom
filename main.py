import uvicorn
from routings import ping_route, parse_route
from fastapi import FastAPI


app = FastAPI()
app.include_router(ping_route)
app.include_router(parse_route)


if __name__ == "__main__":
    config = uvicorn.Config("main:app",host='0.0.0.0', port=8000, log_level="info")
    server = uvicorn.Server(config)
    server.run()

from fastapi import APIRouter, Response


ping_route = APIRouter()


@ping_route.get('/ping')
async def ping():
    return Response(content='pong', media_type="application/json")

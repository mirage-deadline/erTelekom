from fastapi import APIRouter, Request, Response
from utils.model_creator import DynamicModel


parse_route = APIRouter()


@parse_route.post('/parse')
async def parse(request: Request):
    try:
        random_names = await request.json()
        return Response(DynamicModel(**random_names).get_json_obj())
    except Exception:
        return Response("Use '{\"any\":\"any\", ...}' format", 404)

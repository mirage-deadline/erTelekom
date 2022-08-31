import pydantic


class DynamicModel:

    __slots__ = ('__random_model')

    def __init__(self, **kwargs) -> None:
        self.__random_model = pydantic.create_model('RandomModel', **kwargs)()
    
    def get_json_obj(self) -> str:
        return self.__random_model.json()

    def get_dict_obj(self) -> dict:
        return self.__random_model.dict()

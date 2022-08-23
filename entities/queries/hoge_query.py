class HogeQueryU:
    @staticmethod
    def get_hoges_query() -> str:
        """ ほげ一覧を取得するSQL """
        return f"SELECT * FROM hoges;"

    @staticmethod
    def get_hoges_query() -> str:
        """ ほげ一覧を取得するSQL """
        query = """
                SELECT ULID_ENCODE(hoge_id) AS hoge_id, hoge_name
                FROM hoges;
                """
        return query

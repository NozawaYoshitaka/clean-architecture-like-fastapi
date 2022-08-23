class UserQueryU:
    @staticmethod
    def get_users_query() -> str:
        """ 全ユーザー情報を取得するSQL """
        query = """
                SELECT ULID_ENCODE(user_id) AS user_id, user_name, mail_address
                FROM users;
                """
        return query

    @staticmethod
    def get_selected_user_query(user_id: str) -> str:
        """ 特定のユーザー情報を取得するSQL """
        query = f"""
                SELECT ULID_ENCODE(user_id) AS user_id, user_name, mail_address 
                FROM users 
                WHERE user_id = ULID_DECODE('{user_id}');
                """
        return query

    @staticmethod
    def update_selected_user_query(user_id: str, user_name: str, mail_address: str, password: str) -> str:
        """ 特定のユーザー情報を更新するSQL """
        query = f"""
                UPDATE users 
                SET user_name="{user_name}", mail_address="{mail_address}", password="{password}" 
                WHERE user_id = ULID_DECODE('{user_id}');
                """
        return query

    @staticmethod
    def insert_user_query(user_id: str, user_name: str, mail_address: str, password: str) -> str:
        """ ユーザー情報を追加するSQL """
        query = f"""
                INSERT INTO users (user_id, user_name, mail_address, password)
                VALUES (ULID_DECODE("{user_id}"), "{user_name}", "{mail_address}", "{password}" );
                """
        return query

    @staticmethod
    def delete_user_query(user_id: str) -> str:
        """ ユーザー情報を追加するSQL """
        query = f"""
                DELETE FROM users 
                WHERE user_id = ULID_DECODE('{user_id}');
                """
        return query

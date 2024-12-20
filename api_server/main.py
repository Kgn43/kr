from http.server import HTTPServer
from time import sleep
from socketserver import TCPServer
from json import load
import json
import psycopg2
from http.server import SimpleHTTPRequestHandler as HTTP_handler
from json import loads, JSONDecodeError, dumps
from server_functions import *
import hashlib
"""

block of api functions

"""

def create_user(admin_key, user_name, user_password):
    """
    Создает нового пользователя в базе данных.
    :param admin_key: Ключ администратора, для определения прав пользователя.
    :param user_name: Имя пользователя.
    :param user_password: Пароль пользователя.
    :return: Сообщение об успешном создании пользователя.
    """
    global db_connection
    try:
        # Определяем, будет ли пользователь администратором
        is_admin = admin_key == "goool"
        # Открываем курсор для выполнения запроса
        cursor = db_connection.cursor()
        # SQL-запрос для добавления нового пользователя
        insert_user_query = """
        INSERT INTO users (name, passwd, is_admin)
        VALUES (%s, %s, %s)
        RETURNING id;
        """
        cursor.execute(insert_user_query, (user_name, user_password, is_admin))
        # Получаем ID нового пользователя
        user_id = cursor.fetchone()[0]
        # Фиксируем изменения в базе данных
        db_connection.commit()
        # Закрываем курсор
        cursor.close()
        print(f"Пользователь с ID {user_id} успешно создан. Администратор: {is_admin}")
        # Возвращаем подтверждение создания
        return {"message": "Пользователь успешно создан", "user_id": user_id, "is_admin": is_admin}
    except Exception as e:
        print(f"Ошибка при создании пользователя: {e}")
        raise ValueError("Не удалось создать пользователя")


def new_recipe(user_id, recipe_name, ingredients, way_to_cook):
    global db_connection
    if not recipe_name or not ingredients or not way_to_cook:
        raise ValueError("Название рецепта, способ приготовления и список ингредиентов не могут быть пустыми")
    try:
        # Проверяем, является ли пользователь администратором
        cursor = db_connection.cursor()
        admin_check_query = """
        SELECT is_admin FROM users WHERE id = %s;
        """
        cursor.execute(admin_check_query, (user_id,))
        result = cursor.fetchone()
        if not result or not result[0]:
            raise ValueError("Недостаточно прав")
        # SQL-запрос для вставки нового рецепта
        insert_recipe_query = """
        INSERT INTO recipes (name, way_to_cook)
        VALUES (%s, %s)
        RETURNING id;
        """
        cursor.execute(insert_recipe_query, (recipe_name, way_to_cook))
        recipe_id = cursor.fetchone()[0]
        # Вставляем ингредиенты для рецепта
        insert_ingredient_query = """
        INSERT INTO ingredients_for_recipes (recipe_id, ingredient_id, quantity, unit)
        VALUES (%s, %s, %s, %s);
        """
        for ingredient in ingredients:
            cursor.execute(insert_ingredient_query, (
                recipe_id,
                ingredient['ingredient_id'],
                ingredient['quantity'],
                ingredient['unit']
            ))
        # Фиксируем изменения в базе данных
        db_connection.commit()
        # Закрываем курсор
        cursor.close()
        print(f"Рецепт создан: {recipe_name} (ID: {recipe_id})")
        # Возвращаем информацию о созданном рецепте
        return {"id": recipe_id, "name": recipe_name}
    except Exception as e:
        # В случае ошибки откатываем изменения
        db_connection.rollback()
        print(f"Ошибка при создании рецепта: {e}")
        raise ValueError("Не удалось создать рецепт")


def get_ingredients():
    """
    Получает список всех ингредиентов из базы данных.
    :return: Список словарей с информацией об ингредиентах (id и name).
    """
    global db_connection
    try:
        # Открываем курсор для выполнения запроса
        cursor = db_connection.cursor()
        # SQL-запрос для получения ингредиентов
        select_query = """
        SELECT id, name FROM ingredients;
        """
        cursor.execute(select_query)
        # Извлекаем результаты запроса
        ingredients = cursor.fetchall()
        # Закрываем курсор
        cursor.close()
        # Преобразуем результаты в список словарей
        ingredient_list = [
            {"id": ingredient[0], "name": ingredient[1]}
            for ingredient in ingredients
        ]
        print(f"Получено {len(ingredient_list)} ингредиентов из базы данных.")
        # Возвращаем список ингредиентов
        return ingredient_list
    except Exception as e:
        print(f"Ошибка при получении списка ингредиентов: {e}")
        raise ValueError("Не удалось получить список ингредиентов")

def get_recipe():
    """
    Получает список всех рецептов из базы данных.
    :return: Список словарей с информацией о рецептах (id, name, way_to_cook, ingredients).
    """
    global db_connection
    try:
        # Открываем курсор для выполнения запроса
        cursor = db_connection.cursor()
        # SQL-запрос для получения рецептов
        select_recipes_query = """
        SELECT id, name, way_to_cook FROM recipes;
        """
        cursor.execute(select_recipes_query)
        recipes = cursor.fetchall()
        # Создаем список рецептов с ингредиентами
        recipe_list = []
        for recipe in recipes:
            recipe_id, name, way_to_cook = recipe
            # Получаем ингредиенты для рецепта
            select_ingredients_query = """
            SELECT i.id, i.name, ir.quantity, ir.unit
            FROM ingredients_for_recipes ir
            JOIN ingredients i ON ir.ingredient_id = i.id
            WHERE ir.recipe_id = %s;
            """
            cursor.execute(select_ingredients_query, (recipe_id,))
            ingredients = cursor.fetchall()
            # Преобразуем ингредиенты в список словарей
            ingredient_list = [
                {"id": ingredient[0], "name": ingredient[1], "quantity": ingredient[2], "unit": ingredient[3]}
                for ingredient in ingredients
            ]
            # Добавляем рецепт в общий список
            recipe_list.append({
                "id": recipe_id,
                "name": name,
                "way_to_cook": way_to_cook,
                "ingredients": ingredient_list
            })
        # Закрываем курсор
        cursor.close()
        print(f"Получено {len(recipe_list)} рецептов из базы данных.")
        # Возвращаем список рецептов
        return recipe_list
    except Exception as e:
        print(f"Ошибка при получении списка рецептов: {e}")
        raise ValueError("Не удалось получить список рецептов")

def get_favourite(user_id):
    """
    Получает список любимых рецептов пользователя с их ингредиентами.
    :param user_id: Идентификатор пользователя.
    :return: Список словарей с информацией о любимых рецептах и их ингредиентах.
    """
    global db_connection
    try:
        # Открываем курсор для выполнения запроса
        cursor = db_connection.cursor()
        # Проверяем, существует ли пользователь
        user_check_query = """
        SELECT id FROM users WHERE id = %s;
        """
        cursor.execute(user_check_query, (user_id,))
        if not cursor.fetchone():
            raise ValueError("Пользователь не найден")
        # SQL-запрос для получения любимых рецептов
        select_favourites_query = """
        SELECT r.id, r.name, r.way_to_cook
        FROM favourite f
        JOIN recipes r ON f.recipe_id = r.id
        WHERE f.user_id = %s;
        """
        cursor.execute(select_favourites_query, (user_id,))
        favourites = cursor.fetchall()
        favourite_list = []
        for favourite in favourites:
            recipe_id, name, way_to_cook = favourite
            # Получаем ингредиенты для каждого любимого рецепта
            select_ingredients_query = """
            SELECT i.id, i.name, ir.quantity, ir.unit
            FROM ingredients_for_recipes ir
            JOIN ingredients i ON ir.ingredient_id = i.id
            WHERE ir.recipe_id = %s;
            """
            cursor.execute(select_ingredients_query, (recipe_id,))
            ingredients = cursor.fetchall()
            ingredient_list = [
                {"id": ingredient[0], "name": ingredient[1], "quantity": ingredient[2], "unit": ingredient[3]}
                for ingredient in ingredients
            ]
            favourite_list.append({
                "id": recipe_id,
                "name": name,
                "way_to_cook": way_to_cook,
                "ingredients": ingredient_list
            })
        # Закрываем курсор
        cursor.close()
        print(f"Получено {len(favourite_list)} любимых рецептов пользователя с ID {user_id}.")
        # Возвращаем список любимых рецептов
        return favourite_list
    except Exception as e:
        print(f"Ошибка при получении любимых рецептов: {e}")
        raise ValueError("Не удалось получить любимые рецепты")


def get_user_indent(username, password):
    """
    Аутентифицирует пользователя по имени и паролю.
    Возвращает хэшированный ключ, если аутентификация успешна.
    Выбрасывает исключение, если аутентификация не удалась.
    """
    cursor = db_connection.cursor()
    try:
        query = "SELECT passwd FROM users WHERE name = %s"
        cursor.execute(query, (username,))
        result = cursor.fetchone()
        if not result:
            raise ValueError("Пользователь не найден")
        stored_password = result[0]
        if stored_password != password:
            raise ValueError("Неверные учетные данные")
        # Генерация хэшированного ключа в качестве идентификационного ключа
        user_key = hashlib.sha256(f"{username}{password}".encode()).hexdigest()
        return {"user_key": user_key}
    except Exception as e:
        raise e
    finally:
        cursor.close()


"""

block of api server class

"""

class Exchanger_server(HTTP_handler):
    def do_POST(self):
        print(f"Received POST request to {self.path}:")
        print(f"Headers: {self.headers}")
        try:
            content_length = int(self.headers['Content-Length'])
            body = self.rfile.read(content_length).decode('utf-8')
            data = loads(body)
            print(f"Body: {data}")
        except:
            return self.send_bad_response("Invalid JSON")

        try:
            if self.path == "/recipe":
                response_data = new_recipe(data.get("name"), data.get("ingredients"), data.get("way_to_cook"))
            elif self.path == "/user":
                response_data = new_user(data.get("user_name"), data.get("user_password"))
            else:
                raise ValueError("Not found")
        except Exception as e:
            return self.send_bad_response(e)
        self.send_good_response(response_data)

    def do_GET(self):
        print(f"Received GET request to {self.path}:")
        print(f"Headers: {self.headers}")
        try:
            if self.path == "/ingredients":
                response_data = get_ingredients()
            elif self.path == "/recipe":
                response_data = get_recipe()
            elif self.path == "/user/login":
                response_data = get_user_indent(data.get("user_name"), data.get("user_password"))
            elif self.path == "/recipe/filter":
                response_data = get_recipe_by_filter(data.get("good_ingredients"), data.get("bad_ingredients"))
            elif self.path == "/favourite":
                response_data = get_favourite(self.headers.get("X-USER-KEY"))
            else:
                raise ValueError("Not Found")
        except Exception as ex:
            return self.send_bad_response(ex)
        self.send_good_response(response_data)

    def do_DELETE(self):
        print(f"Received DELETE request to {self.path}:")
        print(f"Headers: {self.headers}")
        try:
            if self.path == "/order":
                content_length = int(self.headers['Content-Length'])
                body = self.rfile.read(content_length).decode('utf-8')
                data = loads(body)
                print(f"Body: {data}")
                delete_recipe(
                    self.headers.get("X-USER-KEY"),
                    data.get("recipe_id")
                )
            else:
                raise ValueError("Not Found")
        except Exception as e:
            return self.send_bad_response(e)
        self.send_good_response(b"")

    def send_good_response(self, data):
        self.send_response(200)
        self.send_header('Content-type', 'application/json')
        self.end_headers()
        if data:
            self.wfile.write(dumps(data).encode())

    def send_bad_response(self, error):
        self.send_response(400)
        self.end_headers()
        self.wfile.write(str(error).encode())


db_connection = None

DB_CONFIG = {
    'dbname': 'root',
    'user': 'root',
    'password': 'root',
    'host': 'db',
    'port': 5432
}


def initialize_db_connection():
    global db_connection
    try:
        db_connection = psycopg2.connect(**DB_CONFIG)
        print("Успешное подключение к базе данных.")
    except Exception as e:
        print(f"Ошибка подключения к базе данных: {e}")
        exit(1)

def close_db_connection():
    global db_connection
    if db_connection:
        db_connection.close()
        print("Соединение с базой данных закрыто.")


def main():
    sleep(5)
    try:
        initialize_db_connection()

        server_address = ('0.0.0.0', 5252)
        httpd = HTTPServer(server_address, Exchanger_server)
        print("Сервер запущен на порту 5252...")
        httpd.serve_forever()
    except KeyboardInterrupt:
        print("\nОстановка сервера...")
    finally:
        # Закрытие соединения с БД
        close_db_connection()


if __name__ == "__main__":
    main()

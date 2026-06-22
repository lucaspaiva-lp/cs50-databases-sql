from cs50 import SQL

db = SQL("sqlite:///dont-panic.db")

# Captura a senha digitada pelo usuário ou pelo robô de teste
password = input("Enter a password: ")

db.execute(
    """
    UPDATE "users"
    SET "password" = ?
    WHERE "username" = 'admin';
    """,
    password
)

print("Hacked!")
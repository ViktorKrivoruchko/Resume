import random as rd


print("Введите длину паролей:")
password_length = int(input())
print("Введите количество паролей:")
number_of_passwords = int(input())

with open("Пароли.txt", "w", encoding = "utf-8") as f:
    for i in range(0, number_of_passwords):
        s = ""
        for j in range(0, password_length):
            if rd.choice([True, False]):
                s = s + chr(rd.randint(ord("A"), ord("z")))
            else:
                s = s + chr(rd.randint(ord("!"), ord("@")))
        f.write(s + "\n")

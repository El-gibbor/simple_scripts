#!/usr/bin/env python3
# from sqlalchemy import column, integer, string

# class User(Base):
#     __tablename__ = 'users'
    
#     id = column(integer , primary_key=True)
#     name = column(string)
#     fullname = column(string)
#     nickname = column(string)
    
#     def __repr__(self):
#         return "<User(name='%s', fullname='%s', nickname='%s')>" %\
#             (self.name, self.fullname, self.nickname)
# # Connect to the database and create a cursor object

# import MySQLdb
# from sys import argv
# db = MySQLdb.connect(
#     read_default_file="~/.my.cnf",
#     db=argv[1], host="localhost",
#     charset='utf8mb4',
# )
# curs = db.cursor()

# # Use the database specified in argv[1]
# curs.execute(f"USE {argv[1]};")

# # Execute query
# q = "SELECT cities.id, cities.name FROM cities JOIN states\
#     ON cities.state_id = states.id WHERE states.name = %s\
#         ORDER BY cities.id ASC"
# curs.execute(q, (argv[2],))
# city_in_arg = curs.fetchall()

# Print result
# print(", ".join([city[1] for city in city_in_arg if city is not None]))

def me(arg, *args, **kwargs):
    print(arg)
    for i in args:
        print(i)
    if kwargs:
        for k,v in kwargs.items():
            print(f"{k} : {v}", end="\n")

me(
    "this",
    "is", "me", "and",
   name = "mohamed", me = "me", school = "holberton"
)

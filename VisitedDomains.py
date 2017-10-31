#!/usr/bin/python3
import sys
import sqlite3

db = sqlite3.connect("WebApp/db/development.sqlite3" )

cursor = db.cursor()
sql = "select host,Count(*) as n from standard_comunications group by host"
sql2 = "delete from  `visited_domains`"
print(sql2)
try:
    # Esecuzione della query SQL
    cursor.execute(sql2)
    # Commit
    db.commit()

    print("ho eliminato tutto ")
except:
    # Rollback in caso di errore
    db.rollback()
    print("Eccezzione nell'elimina")

with db:

    cur = db.cursor()
    cur2 = db.cursor()
    cur.execute(sql)

    while True:

        row = cur.fetchone()

        if row == None:
            break
        print(row[0]+"-"+str(row[1]))
        sql2 = "INSERT INTO `visited_domains`('host','times','created_at','updated_at') VALUES ('"+row[0]+"','"+str(row[1])+"',date('now'),date('now'))"
        print(sql2)
        try:
            # Esecuzione della query SQL
            cur2.execute(sql2)
            # Commit
            db.commit()

            print("Salvato")
        except:
            # Rollback in caso di errore
            db.rollback()
            print("Eccezzione")
db.commit()
db.close()

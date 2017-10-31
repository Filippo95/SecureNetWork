#!/usr/bin/python3
import sys
import sqlite3
import re2
print("inizio")
i =3
db = sqlite3.connect("WebApp/db/development.sqlite3" )
cursor = db.cursor()
sql = "delete  from  hosts"

try:
    # Esecuzione della query SQL
    cursor.execute(sql)
    # Commit
    db.commit()

    print("cancellato ")
except:
    # Rollback in caso di errore
    db.rollback()
    print("Eccezzione")

for line in sys.stdin:
    if i > 0:
        print("-----------------------------------------------------")
        print("Host ")

        r = re2.compile('ether(.*?)C')
        m = r.search(line)
        if m:
            lyrics = m.group(1)
        print("MAC:"+lyrics)
        Mac=lyrics
        r = re2.compile('(.*?)ether')
        m = r.search(line)
        if m:
            lyrics = m.group(1)
        print("IP:"+lyrics)
        ip=lyrics

        # Query di UPDATE
        sql = "INSERT INTO `hosts`('ip',`mac`,'created_at','updated_at') VALUES ('"+ip+"','"+Mac+"',date('now'),date('now'))"

        try:
            # Esecuzione della query SQL
            cursor.execute(sql)
            # Commit
            db.commit()

            print("Salvato")
        except:
            # Rollback in caso di errore
            db.rollback()
            print("Eccezzione")

db.close()

#!/usr/bin/python3
import sys
import sqlite3
import re2
print("inizio")
i=0
for line in sys.stdin:
    if i > 0:
        print("-----------------------------------------------------")
        print("Pacchetto ")
        db = sqlite3.connect("WebApp/db/development.sqlite3" )

        cursor = db.cursor()
        if "http"  in line:
            protocol="http"
        if "https"  in line:
            protocol="https"

        str=re2.findall(r'\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}', line)
        print("Protocol:"+protocol)
        print("Source:"+str[0])
        source=str[0]
        print("Destination:"+str[1])
        destination=str[1]
        r = re2.compile('://(.*?)/')
        m = r.search(line)
        if m:
            lyrics = m.group(1)
        print("Host:"+lyrics)
        # Query di UPDATE
        sql = "INSERT INTO `standard_comunications`('date',`data`,'created_at','updated_at','source','destination','protocol','host') VALUES (CURRENT_TIMESTAMP,'"+line+"',date('now'),date('now'),'"+source+"','"+destination+"','"+protocol+"','"+lyrics+"')"
        
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
    else:
        i+=1

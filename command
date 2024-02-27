#1   sudo -i -u postgres

#2   psql
    psql -U postgres
    

#3   \c,  connect to a specific database, \conninfo  
   \dt,   list table in the current database   
    \l     list all database
    \d     your table name
    \conninfo
    \dt
    \dt+   list of relations
    \d and nameoftable it show the structions of the table relations
    

    references
    #the cascade delete all records

    # set delete to null, it save other record in the references table
# build/install and start or in this case pip install and run..

    may not need...   docker-compose build

    docker-compose up

# no.. it isn't running to be able to exec..

    docker-compose exec py python main.py

# Run the script

    This give error:
    File "main.py", line 7, in <module>  import mysql.connector ModuleNotFoundError: No module named 'mysql'

     - docker-compose run --rm py python main.py

# pip freeze

    hmm... this isn't working.

    docker-compose run --rm py pip freeze -r requirements.txt

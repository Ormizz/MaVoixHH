bind = "127.0.0.1:8000"  # Adresse IP et port d'écoute
workers = 4  # Nombre de travailleurs Gunicorn (généralement, n_cores * 2 + 1)
timeout = 120  # Délai d'expiration pour les connexions

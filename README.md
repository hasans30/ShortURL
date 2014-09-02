Python Flask URL Shortener
==========================

Run the app
-----------

    $ virtualenv sandbox
    $ cd sandbox
    $ git clone git@github.com:atheiman/ShortURL.git
    $ cd ShortURL
    $ pip install Flask
    $ pip install flask-sqlalchemy
    $ python
    >>> from shorturl import db
    >>> db.create_all()
    >>> quit()
    $ python shorturl.py

Use the app
-----------

[localhost:5000](http://localhost:5000)

Use the API
-----------

[localhost:5000/api/https://www.ridiculously.long.url.com/path/to/file.html](http://localhost:5000/api/https://www.ridiculously.long.url.com/path/to/file.html)

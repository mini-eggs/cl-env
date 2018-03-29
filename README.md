# cl-env

cl-env is a project for loading environment variables from .env files into the current environment. Storing configuration in the environment separate from code is based on [The Twelve-Factor App](https://12factor.net/config) methodology.

Calling `(cl-env:init)` will attempt to load the .env file in the current working directory into your environment (accessible with `(uiop:getenv)`). If there is no file nothing will be loaded into your environment.

### Usage:

```lisp
(cl-env:init) ;; load .env for the same directory as current directory.
```

or

```lisp
(cl-env:init #p"~/Projects/your-cool-project/.env") ;; load .env from a specific directory.
```

or

```lisp
(cl-env:init (merge-pathnames (truename ".") ".env")) ;; load .dev.env from current directory.
```

# Runnings test

1.  Clone this repo

2.  Run `make test`

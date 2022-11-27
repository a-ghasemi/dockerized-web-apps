# Static amount of app servers
## Description
In this sample, we have exactly 2 app (app1 + app2). They can be more but needs some changes before build (which means stopping workspace and rebuild it)

## Build
First build some images

`docker compose build`

## Run
Run with 3 instances of python servers

`docker compose up`

## Test
- After running successfully the above phrase, open the [localhost:8081](http://localhost:8081) to visit the message
- now start pressing F5 on the browser to see different messages
- also it is visible in the `docker compose log`
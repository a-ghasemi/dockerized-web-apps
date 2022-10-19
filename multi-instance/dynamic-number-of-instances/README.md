# Dynamic amount of app servers
## Description
In this sample, we can run/stop app servers in the running time. without needed to stop them or rebuild something

# Build
First build some images

`docker compose build`

# Run
Run with 3 instances of python servers

`docker compose up --scale app=3`

# Good to know
You can change the number of containers at the running time with same command

`docker compose up --scale app=10`

`docker compose up --scale app=1`

## Test
- After running successfully the above phrase, open the [localhost:8081](http://localhost:8081) to visit the message
- now start pressing F5 on the browser to see different messages
- also it is visible in the `docker compose logs -f` results
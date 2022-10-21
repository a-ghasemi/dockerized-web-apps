# Networking plays

## Use-case
In this test case, We are going to create 3 container, with below details:
- node1: connected to networks net1 & net2 
- node2: connected to networks        net2 & net3
- node3: connected to network                net3

Then we will ping node2 and node3 inside node1 and let see if node1 can see node2 or node3

## Run
Run `sudo docker compose up` without `-d` to see the ping result
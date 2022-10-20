# How to sniff packets between docker containers

## Use-case
My first docker package contained two docker image. First, nginx as web server and second one, php-fpm as an interpreter.
But when I tried to call root domain of my sample application, it showed HTTP 404!

Then I doubted that maybe the proxy is not working because of the location, which was configured in the nginx config file

I decided to look at the packages between my containers. I thought there should be an easy way, but there wasn't. At least before this document.

## How to do that?
### find the network name
1. Run `sudo docker network ls` to see and find your network name
2. Run `sudo tcpdump -i br-xxxx` to sniff the exact network

*note1:* 'xxxx' is your network's id number, first 4 digits
*note2:* I'm not so sure that it always starts with *br-* combination. I need to test this and find a better way to get that
*note3:* My current way to find this *br-* is, using Wireshark (I know I could sniff with it too, but I want to do this with tcpdump, and no need to install 3rd party applications)
- Open wireshark
- Click Capture menu
- Open each Item and find your network's gateway. Which is in the result of `sudo docker network inspect xxxx`. Mine was 172.20.0.1
- It shows the name
- Or, you can look after network id

### some ways to find the br- element
#### using network id
- `sudo docker network ls`
- `ifconfig | grep xxxx`
- The device name should be in the first

#### using network gateway
- `sudo docker network ls`
- `sudo docker network inspect xxxx | grep Gateway`
- `ifconfig | grep aaa.bbb.` // first numbers of the gateway should be enough
- The device name should be in the first

#### using container Gateway
- `sudo docker inspect xxxx | grep Gateway` // docker container id
- `ifconfig | grep aaa.bbb.` // first numbers of the gateway should be enough
- The device name should be in the first

#### using container IPAddress
- `sudo docker inspect xxxx | grep IPA` // docker container id
- `ifconfig | grep aaa.bbb.` // first numbers of the ip_address should be enough
- The device name should be in the first


### what are my containers exact IP addresses?
1. Run `sudo docker inspect xxxx | grep IPA`

*note:* 'xxxx' is your container's id number, first 4 digits

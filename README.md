# Containerisation
- Allows code to be run on any Operating System
- Shares resources with local machine
- More lightweight and faster than VM's
## Containerisation Software
- Docker
- Rocket
## Docker
### What is Docker?
- Open source platform
- Enables us to separate applications from infrastructure
- Allows us to deliver software faster
- Written in GO (language)
### Why learn Docker?
- Multi billion dollar companies are using or adopting Docker e.g. Ebay, Netflix,
Sky, and many more
- Docker adoption was anticipated to be 50% by the end of 2020
- Lightweight and user friendly
- Shares resources with OS as opposed to using the OS completely (as is the case
  with VM's)
- Docker engine connects the container with OS and only uses the resources required
- VM works with Hypervisor to connect guest OS/VM with Host OS/server
![VM vs Container](./images/vm_vs_containers.png)
### Demand and future of Docker
-
### Docker API
### DockerHub
- DockerHub repo required to see the container or image
- Wrapped up container can be pulled and ran on any OS

### Docker commands
**docker pull image_name**
- This pulls the image from a library and stores it on your local machine, allowing
it to be run
- To test that Docker has been installed correctly we can try and pull hello-world
with 'docket pull hello-world'

**docker images**
- This will show all of the images available, any images you have pulled should
show up here

**docker run image_name**
- This will run the chosen image
- We can run our hello-world image with `docker run hello-world`. If everything
was successful, we should see a hello message telling us that the installation
is working correctly

**docker build -t image_name**
-

**docker commit image_name/container_id**
-

**docker start container_id**
-

**docker stop container_id**
-

**docker rm container_id**
- Deletes a specified container

**docker ps and ps-a**
- Checks the existing containers

**docker exec -it container_id**
- 

### Logging into a running container
`docker exec -it container_id`

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
- Containers are created from images
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
### Docker API
![Architecture](./images/docker_architecture.PNG)
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
- You can run this command without pulling, as docker will check your local machine
for this image and if not found it will try to find it and pull it from the registry
- We can run our hello-world image with `docker run hello-world`. If everything
was successful, we should see a hello message telling us that the installation
is working correctly

**docker rmi image_name**
- This will delete the specified image

**docker build -t image_name .**
- This will create an image using a Dockerfile

**docker commit container_id username/repo_name**
- Commits a container to be pushed to a given repository

**docker push username/repo_name**
- This will push your image to the dockerhub repo
- This command requires your dockerhub username and your case sensitive repo name

**docker start container_id**
- This starts a container that isn't currently running

**docker stop container_id**
- This stops a running container
- Changes made since it started are kept when stopping, and will persist when
started again

**docker rm container_id**
- Deletes a specified container
- This container will no longer be viewable with `docker ps` or `docker ps -a`
- Any changes made while it was running will not persist once removed even if
the container is run again

**docker ps and ps -a**
- With ps, this displays the currently running containers
- With ps -a, this displays all available containers whether they are currently
running or not

**docker exec -it container_id bash**
- This logs into a running container to edit its configuration or check the
environment with the specified

**docker history container_id/name**
- Shows the history of an image

**docker inspect image_id/name**
- Shows information of an image
- Can be used to find out about an image without entering the container e.g.
ports used, commands run etc.

**docker logs container_id/name**
- Shows the contents of the logs for the specified container
- If desired, we can put the output of this command into a file with `docker logs
container_id/name >> name_of_file.txt`
  - This command will not run if you have aliased docker to winpty docker so open
  a new terminal and the command should go through
  - Alternatively we can edit the environment variable set to only change docker
  exec to winpty docker exec so that winpty is not placed in front of all
  docker commands

#### Flags
**-d**
- Used to run images in a detached mode
- This allows us access to the terminal for images that may take
control of it while running

**-p localhost_port:container_port**
- Used for port mapping

**-f**
- Used to force a command e.g. removing a container

**-it**
- This specifies an interactive shell will be used

### Logging into a running container
`docker exec -it container_id shell_type`
- On Windows this may give the following error "the input device is not a TTY.  If you are using mintty, try prefixing the command with 'winpty'"
- A way to fix this is to either add `winpty` before the command each time you
run it, or enter the following command `alias docker="winpty docker"` which will
allow it to work as long as this terminal is open
- To fix this permanently, you can create an environment variable so that this
mapping persists on any terminal
- Once logged into the container, you can change it's configuration
#### Copying in files from localhost to container
- The general syntax is `docker cp <source> <destination>` where the destination
will be the file path preceded by the container id/name and a colon
- An specific example could be `docker cp index.html ea35b31c13f4:usr/share/nginx/html/`
### Making docker docs available on our local host
`docker run -d -p 4000:4000 docs/docker.github.io`
- This will mean we can pull locally in the future instead of having to rely on
the internet

### Building a docker image
- To build a docker image we need to create a Dockerfile
- The naming convention is important, needs a capital D and no file extension
#### Why build an image?
- To automate the tasks
#### What information is required in the Dockerfile?
- It depends on the container and the client's requirements/needs
- We need to know the dependencies to run the app/db
- We need to wrap up all of the dependencies in our Dockerfile and instruct the
execution command
#### What is the syntax of a Dockerfile?
- Starts with ```FROM``` which tells docker which base image to use when building
- ```LABEL MAINTAINER=email@address.com``` can be used to signify who created
and maintains the image
- ```COPY``` can copy a file or folder from localhost to a container
- ```EXPOSE``` is used to open up ports for the container to use
- ```CMD``` is the execution command
  - We could run ```CMD ["nginx", "-g", "daemon off;"]``` for an nginx based image

## Connecting DockerHub to a GitHub account
- Once logged into DockerHub, click on Account Settings in the top right dropdown
menu
- On the left hand menu click on Linked Accounts
- Click connect for the GitHub provider
- Authorise this action in the pop up and put in your password to finish this process
- Now they are connected and you should see a plug symbol and your github name for
the GitHub provider
### Why do this?
- This helps us set up webhooks which we can use to automate docker development
## Microservices
- Application is made up of many small services that communicate using an API
- Each service has one specific job that it is concerned with
### Why use them?
- Allows for separation of concern
- Can ensure that there isn't a single point of failure
- Allows you to upscale specific parts of an application
- These services are highly maintainable and testable
- If one part of the application breaks we can fix or replace one of these microservices
instead of having to search for and edit that part in a single piece of infrastructure which
will need to be updated as a whole
### Why shouldn't everyone adopt them?
- If you don't have manpower that can quickly and reliably make changes to services
and provision environments then you won't be able to get value out of it
- Requires robust management to maintain operation of all the different services, as
 each one may require different
 - Understanding how each service interacts and all the dependencies required
 for each service can become quite difficult

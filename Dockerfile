# Build this image from the official image of nginx
FROM nginx
# Specifies who built and maintains this image
LABEL MAINTAINER=jatkin-wasti@spartaglobal.com
# Copies file from localhost to our container to change the default nginx page displayed
COPY index.html /usr/share/nginx/html/
# Exposes port 80 to launch in the browser
EXPOSE 80
# Runs a command once all other instructions have finished successfully
CMD ["nginx", "-g", "daemon off;"]

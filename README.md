# Ubuntu-CUDA

This is my Ubuntu docker image include Nvidia driver and CUDA.

If you want to build this image, please change directory to this repository and running command as follow:

```bash
sudo build -t ubuntu-cuda .
```

After build images, deploy it use this command:

```bash
sudo docker run -it -p 22:22 \
--name ubuntu-cuda \
--gpus all \
-u salt:root \
-v /path/to/host/directory:/home \
ubuntu-cuda
```

Attention, after parameter `-v` is your specific directory you want to storage.

You can specific user access container by parameter `-u`, for example `-u salt:root` in which `salt` is my username.

# Deploy Partainer

Firstly, you mast create docker anonymous volumn:

```bash
sudo docker volume create portainer_data
```

```bash
sudo docker run -d -p 9000:9000 \
--name portainer \
--restart always \
-v /var/run/docker.sock:/var/run/docker.sock \
-v portainer_data:/data \
portainer/portainer
```

Input `localhost:9000` in you browser to manage your docker.

# docker-mirai
Set up python and java for deploying [ariadne](https://github.com/GraiaProject/Ariadne) and [mirai](https://github.com/mamoe/mirai)

# Requirements
- Docker
- Your ariadne project
- Your mirai project

# How to use
- run `build_image.sh` to build the docker image
- edit `run_container.sh` and set `backup_dir` to your directory which containing your ariadne and mirai project
- run `run_container.sh`
- run `login_container.sh` to log into the container
- help yourself

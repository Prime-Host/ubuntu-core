# ubuntu-core

[![](https://images.microbadger.com/badges/version/primehost/ubuntu-core.svg)](https://microbadger.com/images/primehost/ubuntu-core "Get your own version badge on microbadger.com")     [![](https://images.microbadger.com/badges/image/primehost/ubuntu-core.svg)](https://microbadger.com/images/primehost/ubuntu-core "Get your own image badge on microbadger.com")


Ubuntu 16.04 LTS server with ssh.

**Connect to it from master:**
```bash
docker exec -it container-name zsh
```

## Features:
- **production ready** (already in use for live containers)
- **ssh** (with oh my zsh custom theme)
- **custom user** (your own user with sudo rigths)
- **cron** (you can use crontab -e)
- **git** (git client installed)
- **sendmail** (you can send emails from this container)
- **home volume** (on master "/var/docker-data/container/")
- **more packages** (curl, vim, nano, unzip)

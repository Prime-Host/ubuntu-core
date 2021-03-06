# ubuntu-core

[![](https://images.microbadger.com/badges/version/primehost/ubuntu-core.svg)](https://microbadger.com/images/primehost/ubuntu-core "Get your own version badge on microbadger.com")     [![](https://images.microbadger.com/badges/image/primehost/ubuntu-core.svg)](https://microbadger.com/images/primehost/ubuntu-core "Get your own image badge on microbadger.com")


Ubuntu 16.04 LTS server with ssh.

**Connect to it from master:**
```bash
docker exec -it container-name zsh
```

## Features:
- **production ready** (already in use for live containers)
- **low CPU consumption** (uses 0.1% of one CPU core)
- **uses only 16 MB of RAM** (with active SSH / ZSH session)
- **ssh** (with oh my zsh custom theme)
- **custom user** (your own user with sudo rigths)
- **cron** (you can use crontab -e)
- **git** (git client installed)
- **sendmail** (you can send emails from this container)
- **home volume** (on master "/var/docker-data/container/")
- **vim** (with utf-8 setting)
- **more packages** (curl, wget, nano, unzip)

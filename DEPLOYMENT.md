# Инструкции по развертыванию на удаленном сервере

## Подготовка сервера

### 1. Установка необходимых пакетов

```bash
# Обновить систему
sudo apt update && sudo apt upgrade -y

# Установить VirtualBox
sudo apt install -y virtualbox

# Установить Vagrant
sudo apt install -y vagrant

# Установить Docker
sudo apt install -y docker.io docker-compose
sudo usermod -aG docker $USER
newgrp docker

# Установить дополнительные пакеты
sudo apt install -y curl wget git
```

### 2. Копирование файлов ДЗ

```bash
# Скопировать архив на сервер
scp 8-03-GitLab-CI-complete.tar.gz user@your-server:/home/user/
scp 8-03-GitLab-CI-complete.tar.gz moodle-server --zone=europe-west3-c
# На сервере распаковать
cd /home/user
tar -xzf 8-03-GitLab-CI-complete.tar.gz
cd 8-03-GitLab-CI
```

## Выполнение Task-1

### 1. Запуск GitLab через Vagrant

```bash
cd Task-1/gitlab-vagrant

# Добавить запись в /etc/hosts
sudo sh -c 'echo "192.168.56.10    gitlab.localdomain gitlab" >> /etc/hosts'

# Запустить Vagrant
VAGRANT_EXPERIMENTAL="disks" vagrant up

# Дождаться завершения (15-30 минут)
# Получить пароль root
vagrant ssh -- sudo cat /etc/gitlab/initial_root_password
```

### 2. Настройка GitLab

1. Открыть http://gitlab.localdomain в браузере
2. Войти как root с полученным паролем
3. Создать новый проект (например, "test-project")
4. Перейти в Settings > CI/CD > Runners
5. Скопировать Registration token

### 3. Регистрация gitlab-runner

```bash
# Зарегистрировать runner
docker run -ti --rm --name gitlab-runner \
  --network host \
  -v /srv/gitlab-runner/config:/etc/gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock \
  gitlab/gitlab-runner:latest register

# Ввести данные:
# GitLab instance URL: http://gitlab.localdomain
# Registration token: [ваш токен]
# Description: docker-runner
# Tags: docker
# Executor: docker
# Default Docker image: alpine:latest

# Запустить runner
docker run -d --name gitlab-runner --restart always \
  --network host \
  -v /srv/gitlab-runner/config:/etc/gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock \
  gitlab/gitlab-runner:latest
```

## Выполнение Task-2

### 1. Настройка репозитория

```bash
cd /home/user/8-03-GitLab-CI

# Инициализировать git
git init
git add .
git commit -m "Initial commit: ДЗ 8-03 GitLab CI/CD"

# Добавить remote origin
git remote add origin http://gitlab.localdomain/root/test-project.git

# Запушить
git push -u origin main
```

### 2. Проверка пайплайна

1. Перейти в GitLab > CI/CD > Pipelines
2. Дождаться успешного выполнения всех этапов
3. Сделать скриншоты результатов

## Полезные команды

```bash
# Проверить статус Vagrant
vagrant status

# Подключиться к VM
vagrant ssh

# Проверить статус Docker
docker ps

# Проверить логи GitLab
sudo gitlab-ctl tail

# Проверить статус runner
docker logs gitlab-runner

# Остановить VM
vagrant halt

# Уничтожить VM
vagrant destroy
```

## Решение проблем

### GitLab не запускается
- Проверить логи: `sudo gitlab-ctl tail`
- Проверить статус: `sudo gitlab-ctl status`
- Перезапустить: `sudo gitlab-ctl restart`

### Runner не подключается
- Проверить логи: `docker logs gitlab-runner`
- Проверить конфигурацию: `cat /srv/gitlab-runner/config/config.toml`
- Перезапустить: `docker restart gitlab-runner`

### Проблемы с сетью
- Проверить /etc/hosts
- Проверить настройки VirtualBox
- Убедиться, что порты не заняты

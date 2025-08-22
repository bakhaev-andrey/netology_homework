# Task-1: Развертывание GitLab и настройка Docker Runner

## Описание
Развертывание GitLab локально через Vagrant и регистрация gitlab-runner в режиме Docker.

## Файлы
- `Vagrantfile` - конфигурация виртуальной машины
- `docker-compose.yaml` - конфигурация Docker для GitLab
- `GITLAB.md` - инструкция по развертыванию

## Требования

Для выполнения задания на удаленном сервере необходимо:
- VirtualBox
- Vagrant
- Docker
- gitlab-runner

### Установка на Ubuntu/Debian:
```bash
# Установить VirtualBox
sudo apt update
sudo apt install -y virtualbox

# Установить Vagrant
sudo apt install -y vagrant

# Установить Docker
sudo apt install -y docker.io docker-compose
sudo usermod -aG docker $USER
```

## Пошаговое выполнение

### 1. Подготовка системы

```bash
# Добавить запись в /etc/hosts
sudo echo '192.168.56.10    gitlab.localdomain gitlab' >> /etc/hosts
```

### 2. Развертывание GitLab через Vagrant

```bash
# Перейти в папку с Vagrantfile
cd Task-1/gitlab-vagrant

# Запустить виртуальную машину (с поддержкой дисков)
VAGRANT_EXPERIMENTAL="disks" vagrant up

# Подключиться к VM
vagrant ssh
```

### 2. Настройка GitLab в VM

После запуска VM выполнить:
```bash
# Установить Docker и Docker Compose
sudo apt update
sudo apt install -y docker.io docker-compose

# Добавить пользователя в группу docker
sudo usermod -aG docker $USER
newgrp docker

# Запустить GitLab через Docker Compose
docker-compose up -d

# Проверить статус
docker-compose ps
```

### 3. Доступ к GitLab

- URL: http://gitlab.localdomain
- Логин: root
- Пароль: получить командой `vagrant ssh -- sudo cat /etc/gitlab/initial_root_password`

### 4. Создание проекта

1. Войти в GitLab как root
2. Создать новый проект (например, "test-project")
3. Создать пустой репозиторий

### 5. Установка и регистрация gitlab-runner

```bash
# Зарегистрировать runner через Docker
docker run -ti --rm --name gitlab-runner \
  --network host \
  -v /srv/gitlab-runner/config:/etc/gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock \
  gitlab/gitlab-runner:latest register

# Ввести данные:
# GitLab instance URL: http://gitlab.localdomain
# Registration token: из Settings > CI/CD > Runners
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

### 6. Проверка работы runner

1. Перейти в Settings > CI/CD > Runners
2. Убедиться, что runner активен и подключен
3. Сделать скриншот настроек runner

## Скриншоты для сдачи
- Настройки runner в проекте
- Статус runner (активен/подключен)
- Конфигурация runner (executor: docker)

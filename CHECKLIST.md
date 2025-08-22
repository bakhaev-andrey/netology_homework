# Чек-лист выполнения ДЗ 8-03: GitLab CI/CD

## Task-1: Развертывание GitLab и настройка Docker Runner

### Подготовка
- [ ] Установить VirtualBox на сервере
- [ ] Установить Vagrant на сервере
- [ ] Установить Docker на сервере
- [ ] Скопировать файлы ДЗ на сервер

### Развертывание GitLab
- [ ] Добавить запись в /etc/hosts: `192.168.56.10 gitlab.localdomain gitlab`
- [ ] Запустить `VAGRANT_EXPERIMENTAL="disks" vagrant up`
- [ ] Дождаться завершения установки (может занять 15-30 минут)
- [ ] Получить пароль: `vagrant ssh -- sudo cat /etc/gitlab/initial_root_password`
- [ ] Открыть http://gitlab.localdomain в браузере
- [ ] Войти как root с полученным паролем

### Создание проекта
- [ ] Создать новый проект (например, "test-project")
- [ ] Создать пустой репозиторий
- [ ] Запомнить URL проекта

### Настройка Runner
- [ ] Перейти в Settings > CI/CD > Runners
- [ ] Скопировать Registration token
- [ ] Запустить регистрацию runner:
  ```bash
  docker run -ti --rm --name gitlab-runner \
    --network host \
    -v /srv/gitlab-runner/config:/etc/gitlab-runner \
    -v /var/run/docker.sock:/var/run/docker.sock \
    gitlab/gitlab-runner:latest register
  ```
- [ ] Ввести данные регистрации
- [ ] Запустить runner:
  ```bash
  docker run -d --name gitlab-runner --restart always \
    --network host \
    -v /srv/gitlab-runner/config:/etc/gitlab-runner \
    -v /var/run/docker.sock:/var/run/docker.sock \
    gitlab/gitlab-runner:latest
  ```
- [ ] Проверить, что runner активен в GitLab

### Скриншоты для Task-1
- [ ] Настройки runner в проекте
- [ ] Статус runner (активен/подключен)
- [ ] Конфигурация runner (executor: docker)

---

## Task-2: Репозиторий в GitLab и CI/CD пайплайн

### Настройка репозитория
- [ ] Перейти в корень проекта ДЗ на сервере
- [ ] Инициализировать git: `git init`
- [ ] Добавить файлы: `git add .`
- [ ] Сделать коммит: `git commit -m "Initial commit"`
- [ ] Добавить remote origin на GitLab
- [ ] Запушить: `git push -u origin main`

### Проверка пайплайна
- [ ] Перейти в CI/CD > Pipelines в GitLab
- [ ] Убедиться, что пайплайн запустился автоматически
- [ ] Дождаться успешного выполнения всех этапов
- [ ] Проверить логи каждого этапа

### Скриншоты для Task-2
- [ ] Успешное выполнение пайплайна
- [ ] Результаты каждого этапа (build, test, deploy)
- [ ] Статус pipeline (passed)

---

## Файлы для сдачи

### Task-1
- [ ] README.md с инструкциями
- [ ] Скриншоты настроек runner
- [ ] Vagrantfile и docker-compose.yaml

### Task-2
- [ ] README.md с инструкциями
- [ ] .gitlab-ci.yml файл
- [ ] Скриншоты успешных сборок

## Полезные команды

```bash
# Проверить статус Vagrant
vagrant status

# Подключиться к VM
vagrant ssh

# Остановить VM
vagrant halt

# Уничтожить VM
vagrant destroy

# Проверить статус Docker контейнеров
docker ps

# Проверить логи GitLab
sudo gitlab-ctl tail

# Проверить статус gitlab-runner
docker logs gitlab-runner
```

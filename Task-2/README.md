# Task-2: Репозиторий в GitLab и CI/CD пайплайн

## Описание
Настройка репозитория в GitLab, изменение origin и создание .gitlab-ci.yml с пайплайном.

## Пошаговое выполнение

### 1. Изменение origin на GitLab

```bash
# Перейти в корень проекта ДЗ
cd /Users/andrey/SciFlow/netology_homework/Автоматизация и CI-CD/8-03-GitLab-CI

# Инициализировать git репозиторий (если еще не инициализирован)
git init

# Добавить все файлы
git add .

# Сделать первый коммит
git commit -m "Initial commit: ДЗ 8-03 GitLab CI/CD"

# Добавить remote origin на GitLab (заменить URL на ваш)
git remote add origin http://localhost:8080/root/8-03-gitlab-ci.git

# Или изменить существующий origin
git remote set-url origin http://localhost:8080/root/8-03-gitlab-ci.git

# Запушить в GitLab
git push -u origin main
```

### 2. Создание .gitlab-ci.yml

Файл `.gitlab-ci.yml` уже создан в корне проекта и содержит:
- Этап build (сборка)
- Этап test (тестирование)
- Этап deploy (деплой)

### 3. Проверка пайплайна

1. После пуша в GitLab автоматически запустится пайплайн
2. Перейти в CI/CD > Pipelines
3. Убедиться, что все этапы прошли успешно
4. Сделать скриншоты успешных сборок

### 4. Структура .gitlab-ci.yml

```yaml
stages:
  - build
  - test
  - deploy

build:
  stage: build
  image: alpine:latest
  script:
    - echo "Building project..."
    - echo "Build completed"

test:
  stage: test
  image: alpine:latest
  script:
    - echo "Running tests..."
    - echo "Tests passed"

deploy:
  stage: deploy
  image: alpine:latest
  script:
    - echo "Deploying to production..."
    - echo "Deployment successful"
```

## Скриншоты для сдачи
- Успешное выполнение пайплайна
- Результаты каждого этапа (build, test, deploy)
- Статус pipeline (passed)

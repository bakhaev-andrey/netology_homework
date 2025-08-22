#!/bin/bash
# Скрипт для настройки репозитория и пайплайна в GitLab

echo "🚀 Настройка репозитория в GitLab..."

# Перейти в корень проекта
cd /path/to/your/project

# Инициализировать git (если нужно)
if [ ! -d ".git" ]; then
    echo "📁 Инициализирую git репозиторий..."
    git init
fi

# Добавить все файлы
echo "📦 Добавляю файлы в git..."
git add .

# Сделать коммит
echo "💾 Создаю коммит..."
git commit -m "Initial commit: ДЗ 8-03 GitLab CI/CD"

# Добавить remote origin (заменить URL на ваш)
echo "🔗 Добавляю remote origin..."
git remote add origin http://gitlab.localdomain/root/8-03-gitlab-ci.git

# Или изменить существующий
# git remote set-url origin http://gitlab.localdomain/root/8-03-gitlab-ci.git

# Запушить в GitLab
echo "📤 Пушим в GitLab..."
git push -u origin main

echo "✅ Репозиторий настроен!"
echo "🌐 Проверить пайплайн: http://gitlab.localdomain/root/8-03-gitlab-ci/-/pipelines"

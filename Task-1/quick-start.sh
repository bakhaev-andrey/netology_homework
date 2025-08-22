#!/bin/bash
# Скрипт для быстрого старта GitLab через Vagrant

echo "🚀 Запуск GitLab через Vagrant..."

# Добавить запись в /etc/hosts (если не добавлена)
if ! grep -q "192.168.56.10.*gitlab.localdomain" /etc/hosts; then
    echo "📝 Добавляю запись в /etc/hosts..."
    sudo sh -c 'echo "192.168.56.10    gitlab.localdomain gitlab" >> /etc/hosts'
else
    echo "✅ Запись в /etc/hosts уже существует"
fi

# Запустить Vagrant
echo "🔧 Запускаю виртуальную машину..."
VAGRANT_EXPERIMENTAL="disks" vagrant up

echo "✅ GitLab запущен!"
echo "🌐 Доступ: http://gitlab.localdomain"
echo "🔑 Получить пароль: vagrant ssh -- sudo cat /etc/gitlab/initial_root_password"
echo "📱 Runner: docker run -ti --rm --name gitlab-runner --network host -v /srv/gitlab-runner/config:/etc/gitlab-runner -v /var/run/docker.sock:/var/run/docker.sock gitlab/gitlab-runner:latest register"

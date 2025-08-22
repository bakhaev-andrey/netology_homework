<<<<<<< HEAD
# Домашнее задание к занятию "GitLab CI/CD" - Бахаев Андрей

## Структура проекта

- **Task-1/** - Развертывание GitLab и регистрация Docker runner
  - `gitlab-vagrant/` - файлы из задания (Vagrantfile и др.)
  - `screenshots/` - скриншоты настроек раннера в проекте
  - `README.md` - пошаговые команды выполнения
- **Task-2/** - Репозиторий в GitLab и пайплайн
  - `screenshots/` - скриншоты успешных сборок
  - `README.md` - пошаговые команды выполнения
- `.gitlab-ci.yml` - файл пайплайна для проекта

## Ссылка на материалы задания
[GitLab материалы](https://github.com/netology-code/sdvps-materials/tree/main/gitlab)

## Подготовленные файлы

### Основные файлы
- `README.md` - описание ДЗ и структуры проекта
- `.gitlab-ci.yml` - готовый пайплайн CI/CD
- `CHECKLIST.md` - пошаговый чек-лист выполнения

### Task-1: Развертывание GitLab
- `Task-1/README.md` - подробные инструкции
- `Task-1/gitlab-vagrant/` - файлы для Vagrant
  - `Vagrantfile` - конфигурация VM
  - `docker-compose.yaml` - Docker Compose для GitLab
  - `GITLAB.md` - оригинальная инструкция
  - `runner-config.toml` - пример конфигурации runner
- `Task-1/quick-start.sh` - скрипт быстрого старта

### Task-2: CI/CD пайплайн
- `Task-2/README.md` - инструкции по настройке
- `Task-2/quick-start.sh` - скрипт настройки репозитория

## Быстрый старт на удаленном сервере

1. **Скопируйте архив** `8-03-GitLab-CI-complete.tar.gz` на сервер
2. **Распакуйте** и перейдите в папку `8-03-GitLab-CI`
3. **Выполните Task-1**: развертывание GitLab через Vagrant и настройка Docker runner
4. **Выполните Task-2**: настройка репозитория и проверка CI/CD пайплайна

## Детальные инструкции

- `DEPLOYMENT.md` - пошаговые инструкции по развертыванию на сервере
- `CHECKLIST.md` - чек-лист выполнения всех задач
- `Task-1/README.md` - инструкции по Task-1
- `Task-2/README.md` - инструкции по Task-2

---

### Задание 1

**Разверните GitLab локально, используя Vagrantfile и инструкцию, описанные в репозитории.**

1. Скачайте материалы из репозитория задания
2. Разверните GitLab через Vagrant
3. Создайте новый проект и пустой репозиторий
4. Зарегистрируйте gitlab-runner для проекта в режиме Docker
5. Приложите скриншоты с настройками раннера

### Задание 2

**Запушьте репозиторий на GitLab и создайте .gitlab-ci.yml**

1. Измените origin на GitLab репозиторий
2. Создайте .gitlab-ci.yml с необходимыми этапами
3. Запушьте изменения
4. Приложите файл .gitlab-ci.yml и скриншоты успешных сборок
=======
# 8-03-gitlab-ci



## Getting started

To make it easy for you to get started with GitLab, here's a list of recommended next steps.

Already a pro? Just edit this README.md and make it your own. Want to make it easy? [Use the template at the bottom](#editing-this-readme)!

## Add your files

- [ ] [Create](https://docs.gitlab.com/ee/user/project/repository/web_editor.html#create-a-file) or [upload](https://docs.gitlab.com/ee/user/project/repository/web_editor.html#upload-a-file) files
- [ ] [Add files using the command line](https://docs.gitlab.com/topics/git/add_files/#add-files-to-a-git-repository) or push an existing Git repository with the following command:

```
cd existing_repo
git remote add origin http://gitlab.bakhaevtech.com/root/8-03-gitlab-ci.git
git branch -M main
git push -uf origin main
```

## Integrate with your tools

- [ ] [Set up project integrations](http://gitlab.bakhaevtech.com/root/8-03-gitlab-ci/-/settings/integrations)

## Collaborate with your team

- [ ] [Invite team members and collaborators](https://docs.gitlab.com/ee/user/project/members/)
- [ ] [Create a new merge request](https://docs.gitlab.com/ee/user/project/merge_requests/creating_merge_requests.html)
- [ ] [Automatically close issues from merge requests](https://docs.gitlab.com/ee/user/project/issues/managing_issues.html#closing-issues-automatically)
- [ ] [Enable merge request approvals](https://docs.gitlab.com/ee/user/project/merge_requests/approvals/)
- [ ] [Set auto-merge](https://docs.gitlab.com/user/project/merge_requests/auto_merge/)

## Test and Deploy

Use the built-in continuous integration in GitLab.

- [ ] [Get started with GitLab CI/CD](https://docs.gitlab.com/ee/ci/quick_start/)
- [ ] [Analyze your code for known vulnerabilities with Static Application Security Testing (SAST)](https://docs.gitlab.com/ee/user/application_security/sast/)
- [ ] [Deploy to Kubernetes, Amazon EC2, or Amazon ECS using Auto Deploy](https://docs.gitlab.com/ee/topics/autodevops/requirements.html)
- [ ] [Use pull-based deployments for improved Kubernetes management](https://docs.gitlab.com/ee/user/clusters/agent/)
- [ ] [Set up protected environments](https://docs.gitlab.com/ee/ci/environments/protected_environments.html)

***

# Editing this README

When you're ready to make this README your own, just edit this file and use the handy template below (or feel free to structure it however you want - this is just a starting point!). Thanks to [makeareadme.com](https://www.makeareadme.com/) for this template.

## Suggestions for a good README

Every project is different, so consider which of these sections apply to yours. The sections used in the template are suggestions for most open source projects. Also keep in mind that while a README can be too long and detailed, too long is better than too short. If you think your README is too long, consider utilizing another form of documentation rather than cutting out information.

## Name
Choose a self-explaining name for your project.

## Description
Let people know what your project can do specifically. Provide context and add a link to any reference visitors might be unfamiliar with. A list of Features or a Background subsection can also be added here. If there are alternatives to your project, this is a good place to list differentiating factors.

## Badges
On some READMEs, you may see small images that convey metadata, such as whether or not all the tests are passing for the project. You can use Shields to add some to your README. Many services also have instructions for adding a badge.

## Visuals
Depending on what you are making, it can be a good idea to include screenshots or even a video (you'll frequently see GIFs rather than actual videos). Tools like ttygif can help, but check out Asciinema for a more sophisticated method.

## Installation
Within a particular ecosystem, there may be a common way of installing things, such as using Yarn, NuGet, or Homebrew. However, consider the possibility that whoever is reading your README is a novice and would like more guidance. Listing specific steps helps remove ambiguity and gets people to using your project as quickly as possible. If it only runs in a specific context like a particular programming language version or operating system or has dependencies that have to be installed manually, also add a Requirements subsection.

## Usage
Use examples liberally, and show the expected output if you can. It's helpful to have inline the smallest example of usage that you can demonstrate, while providing links to more sophisticated examples if they are too long to reasonably include in the README.

## Support
Tell people where they can go to for help. It can be any combination of an issue tracker, a chat room, an email address, etc.

## Roadmap
If you have ideas for releases in the future, it is a good idea to list them in the README.

## Contributing
State if you are open to contributions and what your requirements are for accepting them.

For people who want to make changes to your project, it's helpful to have some documentation on how to get started. Perhaps there is a script that they should run or some environment variables that they need to set. Make these steps explicit. These instructions could also be useful to your future self.

You can also document commands to lint the code or run tests. These steps help to ensure high code quality and reduce the likelihood that the changes inadvertently break something. Having instructions for running tests is especially helpful if it requires external setup, such as starting a Selenium server for testing in a browser.

## Authors and acknowledgment
Show your appreciation to those who have contributed to the project.

## License
For open source projects, say how it is licensed.

## Project status
If you have run out of energy or time for your project, put a note at the top of the README saying that development has slowed down or stopped completely. Someone may choose to fork your project or volunteer to step in as a maintainer or owner, allowing your project to keep going. You can also make an explicit request for maintainers.
>>>>>>> 09ffa5c28273061adc329e055d075a1a1f7382b8

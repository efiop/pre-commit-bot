FROM python:3.7.5-buster

LABEL "com.github.actions.name"="Pre-commit"
LABEL "com.github.actions.description"="Automatically run pre-commit hooks for your PRs"
LABEL "com.github.actions.icon"="git-commit"
LABEL "com.github.actions.color"="green"

LABEL "repository"="https://github.com/efiop/pre-commit-bot"
LABEL "homepage"="https://github.com/efiop/pre-commit-bot"
LABEL "maintainer"="Ruslan Kuprieiev <kupruser@gmail.com>"

RUN pip install pre-commit

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["bash", "/entrypoint.sh"]

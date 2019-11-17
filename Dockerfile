FROM ubuntu:20.04

LABEL "com.github.actions.name"="Pre-commit"
LABEL "com.github.actions.description"="Automatically run pre-commit hooks for your PRs"
LABEL "com.github.actions.icon"="git-commit"
LABEL "com.github.actions.color"="green"

LABEL "repository"="https://github.com/efiop/pre-commit-bot"
LABEL "homepage"="https://github.com/efiop/pre-commit-bot"
LABEL "maintainer"="Ruslan Kuprieiev <kupruser@gmail.com>"

RUN apt install git
RUN snap install hub
RUN pip install pre-commit

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["bash", "/entrypoint.sh"]

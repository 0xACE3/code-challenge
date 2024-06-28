FROM ruby:3.3-slim

ARG USERNAME=serpapi

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    git \
    nano \
    vim-tiny \
    curl \
    && apt-get autoremove -y \
    && apt-get clean -y

# Create a non-root user
RUN useradd -m -s /bin/bash ${USERNAME} \
    && chsh -s $(which bash) ${USERNAME} \
    && echo 'export PS1="\e[01;32m\u\e[m:\e[01;34m\w\e[m\$ "' >> /home/${USERNAME}/.bashrc



# Install Ruby gems
RUN gem install \
    bundler \
    solargraph \
    rake \
    nokogiri \
    faraday \
    rspec


# Switch to non-root user
USER ${USERNAME}
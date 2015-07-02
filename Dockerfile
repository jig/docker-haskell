FROM ubuntu

ENV TERM=linux
RUN apt-get -y update && apt-get -y upgrade
RUN sudo apt-get install -y software-properties-common
RUN sudo add-apt-repository -y ppa:hvr/ghc
RUN sudo apt-get update
RUN sudo apt-get install -y cabal-install-1.22 ghc-7.8.4
ENV PATH /root/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.8.4/bin
RUN cabal update
RUN cabal install alex happy
RUN sudo apt-get install -y build-essential zlib1g-dev libmysqlclient-dev libpq-dev

# Install yesod
RUN cabal update && cabal install yesod yesod-bin persistent-sqlite yesod-static

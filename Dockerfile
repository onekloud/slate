FROM ruby:onbuild
MAINTAINER x@vier.im

#RUN apt-get update
#RUN apt-get install -yq ruby ruby-dev build-essential zlib1g zlib1g-dev
#RUN gem install --no-ri --no-rdoc bundler
#ADD Gemfile /app/Gemfile
#ADD Gemfile.lock /app/Gemfile.lock
#ADD . /app
#RUN cd /app; bundle install
#EXPOSE 4567
#WORKDIR /app

#ONBUILD RUN rm -fr /app/source
##ONBUILD ADD . /app/source
#CMD ["bundle", "exec", "middleman", "server"]

#VOLUME /usr/src/app/source
ADD source /usr/src/app/source
EXPOSE 4567

RUN apt-get update && apt-get install -y nodejs \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["bundle", "exec", "middleman", "server", "--force-polling"]

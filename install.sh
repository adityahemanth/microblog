#!/bin/bash

USER=ubuntu
APP_DIR=/home/$USER/practice/microblog
RAILS_DIR=/home/$USER/.rbenv/shims

echo `/bin/su - $USER -c "cd $APP_DIR && RAILS_ENV=$RAILS_ENV $RAILS_DIR/bundle &"`
echo `/bin/su - $USER -c "cd $APP_DIR && RAILS_ENV=$RAILS_ENV $RAILS_DIR/rails db:create &"`
echo `/bin/su - $USER -c "cd $APP_DIR && RAILS_ENV=$RAILS_ENV $RAILS_DIR/rails db:migrate &"`

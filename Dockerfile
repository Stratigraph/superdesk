# import base image
FROM dockerfile/nodejs

# install system-wide dependencies
RUN npm -g install grunt-cli protractor bower && webdriver-manager update

# setup the environment
WORKDIR	/opt/superdesk-client/
EXPOSE	9000
CMD ["grunt"]

# install app-wide dependencies
COPY ./package.json /opt/superdesk-client/
RUN npm install
COPY ./bower.json /opt/superdesk-client/
COPY ./.bowerrc /opt/superdesk-client/
RUN bower --allow-root install

# copy sources
COPY . /opt/superdesk-client

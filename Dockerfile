# © Copyright IBM Corporation 2018.
#
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Eclipse Public License v2.0
# which accompanies this distribution, and is available at
# http://www.eclipse.org/legal/epl-v20.html

# Choice of ICP private repository or dockerhub
#DA FROM mycluster.icp:8500/default/ace11002mqc91soe:latest
FROM davexacom/ace11002mqc91soe:latest

ENV BAR1=Microservice2.bar

# Copy in the bar file to a temporary directory
#DA COPY --chown=aceuser ./binary/$BAR1 /tmp
COPY --chown=aceuser ./acesoe/binary/$BAR1 /tmp

# Unzip the BAR file; need to use bash to make the profile work
RUN bash -c 'mqsibar -w /home/aceuser/ace-server -a /tmp/$BAR1 -c'

# Switch off the admin REST API for the server run, as we won't be deploying anything after start
#DA RUN sed -i 's/adminRestApiPort/#adminRestApiPort/g' /home/aceuser/ace-server/server.conf.yaml 

# We inherit the command from the base layer

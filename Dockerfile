FROM busybox
ARG THE_SECRET
RUN echo "::${THE_SECRET}::"
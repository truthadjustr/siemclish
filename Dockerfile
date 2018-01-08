FROM truthadjustr/ubuntu1:latest

ENV CLISH_PATH /etc/clish

RUN mkdir /etc/clish /src \
    && wget --no-check-certificate http://prdownloads.sourceforge.net/clish/clish-0.7.3.tar.gz -O /src/clish.tar.gz \
    && tar xf /src/clish.tar.gz -C /src/ && rm -f /src/clish.tar.gz \
    && cd /src/clish-0.7.3 && ./configure && make && make install \
    && echo "export LD_LIBRARY_PATH=/usr/local/lib" >> /root/.bashrc

COPY etc.clish/* /etc/clish/

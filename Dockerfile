FROM    jojomi/pageres
RUN     apt install make
WORKDIR /workdir
COPY    . .

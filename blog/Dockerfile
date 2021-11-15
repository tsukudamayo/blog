FROM node:17.1-bullseye-slim

ENV LANG ja_JP.UTF-8
ENV HOST 0.0.0.0

RUN apt-get update \
    && apt-get install -y git \
    curl \
    yarn \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

RUN git clone https://github.com/tsukudamayo/blog.git

WORKDIR /workspace/blog/blog

RUN npm install

EXPOSE 8080

CMD ["npm", "run", "deploy"]

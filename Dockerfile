FROM --platform=linux/arm64 public.ecr.aws/lambda/nodejs:18

COPY package*.json ${LAMBDA_TASK_ROOT}

RUN npm install

COPY . ${LAMBDA_TASK_ROOT}

RUN npm run build

CMD ["dist/main.handler"]

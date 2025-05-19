FROM python:3.10-slim

WORKDIR /app

RUN pip install --no-cache-dir flask requests curl_cffi werkzeug loguru 

VOLUME ["/data"]

COPY . .

# 是否显示搜索结果
ENV ISSHOW_SEARCH_RESULTS=true

# 是否显示思考模型的思考过程
ENV SHOW_THINKING=true

ENV PORT=3000
EXPOSE 3000

RUN mkdir /data && \
    touch /data/token_status.json && \
    chmod 777 /data/token_status.json

RUN mkdir images \
  && chmod 777 images

CMD ["python", "app.py"]
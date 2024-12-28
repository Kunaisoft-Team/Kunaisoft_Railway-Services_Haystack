FROM deepset/haystack:base-v2.0.0-beta.7

RUN pip install chroma-haystack

COPY ./main.py /usr/src/myapp/main.py

ENTRYPOINT ["python", "/usr/src/myapp/main.py"]

FROM alpine:3.19

COPY grab_this.txt /home

RUN apk add --no-cache \ 
    python3 \ 
    py3-pip \
    openssh-client\
    sshpass

ARG ANSIBLE_VERSION
RUN pip3 install --break-system-packages ansible-core==${ANSIBLE_VERSION}

WORKDIR /ansible/playbooks

ENTRYPOINT ["ansible-playbook"]
CMD ["--version"]
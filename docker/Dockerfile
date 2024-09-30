FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    openssh-server \
    net-tools \
    nmap \
    sudo

# Создаем пользователя admin с паролем "password"
RUN useradd -rm -d /home/admin -s /bin/bash -g root -G sudo -u 1001 admin && \
    echo 'admin:password' | chpasswd
RUN mkdir /var/run/sshd

# Разрешаем SSH логин по паролю
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config && \
    echo "PermitEmptyPasswords no" >> /etc/ssh/sshd_config && \
    echo "ChallengeResponseAuthentication no" >> /etc/ssh/sshd_config

COPY ssh_login_check.sh /usr/local/bin/ssh_login_check.sh
RUN chmod +x /usr/local/bin/ssh_login_check.sh
RUN echo '/usr/local/bin/ssh_login_check.sh' >> /home/admin/.bashrc
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
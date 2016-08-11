FROM fedora:24

RUN ln -sf /usr/share/zoneinfo/Europe/Brussels /etc/localtime && \
dnf -y install vim telnet sl wget xz bzip2 zip tar curl iputils nmap nmap-ncat tmux fish zsh htop python-pip git nc libffi gcc libffi-devel perl-Perl-Critic-More.noarch python-devel automake gcc gcc-c++ kernel-devel cmake redhat-rpm-config openssl-devel vim bind-utils glibc-common glibc-langpack-en procps-ng git libjpeg-turbo-devel python-devel python3-devel ncurses-devel fish man-db man libtool rsync mosh openssh-clients openssh-server && \
dnf search perl-Digest | awk '{ print $1 }' | grep perl | xargs dnf -y install && \
dnf -y install perl-Authen-OATH perl-Data-GUID perl-ExtUtils-Manifest perl-ExtUtils-MakeMaker && \
wget --no-check-certificate -O - http://cpanmin.us | perl - App::cpanminus && \
pip install --upgrade pip && \
python3 -m pip install --upgrade pip && \
pip install butterfly && \
pip install libsass && \
dnf -y install python-paramiko python-gevent python-gevent-websocket python-gevent-socketio python-six python-flask python-setuptools_git python-websocket-client python3-pillow python3-pillow-devel && \
python3 -m pip install gitsome && \
pip install wakatime && \
pip install jsbeautifier && \
cpanm Convert::Base32 && \
dnf install -y vim tmux-powerline tmux-top fish powerline htop ecryptfs-utils tmuxinator && \
rpm -Uv https://github.com/htacg/tidy-html5/releases/download/5.2.0/tidy-5.2.0-64bit.rpm && \
ln -s /usr/local/bin/cpanm /usr/bin/cpanm && \
dnf install -y perl-Locale-Maketext-Simple perl-Locale-Maketext perl-Params-Check perl-Module-Load-Conditional perl-IPC-Cmd perl-ExtUtils-CBuilder perl-Module-Build-Tiny && \
/usr/local/bin/cpanm App::cpanoutdated && \
/usr/local/bin/cpanm Time::Stamp && \
cat /usr/lib/python3.5/site-packages/butterfly/sass/_term_styles.sass | grep -v "@extend .underline" > /tmp/_term_styles.sass && \
cat /tmp/_term_styles.sass > /usr/lib/python3.5/site-packages/butterfly/sass/_term_styles.sass && \
ln -s /usr/lib64/libtinfo.so.6 /usr/lib64/libtinfo.so.5 && ldconfig && \
pip3 install --upgrade neovim && \
dnf clean all && \
rm -fr /var/log/dnf* && \
rm -fr /tmp/* && rm -fr /tmp/.??*

ENTRYPOINT ["/bin/bash"]

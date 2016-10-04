FROM fedora:24

RUN ln -sf /usr/share/zoneinfo/Europe/Brussels /etc/localtime && \
dnf -y install vim telnet sl wget xz bzip2 zip tar curl iputils php php-cli php-pear nmap nmap-ncat fish zsh htop python3-pip python-pip python3 python git nc libffi gcc libffi-devel perl-Perl-Critic-More.noarch automake gcc gcc-c++ kernel-devel cmake redhat-rpm-config openssl-devel vim bind-utils glibc-common glibc-langpack-en procps-ng git libjpeg-turbo-devel python-devel python3-devel ncurses-devel fish man-db man libtool rsync mosh openssh-clients openssh-server autojump-fish libevent-devel libevent fontforge perl-open python2-virtualenv python3-virtualenv perl-Locale-Maketext-Simple perl-Locale-Maketext perl-Params-Check perl-Module-Load-Conditional perl-IPC-Cmd perl-ExtUtils-CBuilder perl-Module-Build-Tiny python-paramiko python-gevent python-gevent-websocket python-gevent-socketio python-six python-flask python-setuptools_git python-websocket-client python3-pillow python3-pillow-devel perl-Authen-OATH perl-Data-GUID perl-ExtUtils-Manifest perl-ExtUtils-MakeMaker fish htop ecryptfs-utils libunwind libicu postgresql-devel postgresql expat-devel bison bison-devel rust cargo glib2-devel atk-devel cairo-devel pango-devel gdk-pixbuf2-devel cairo-gobject-devel gtk3-devel && \
dnf search perl-Digest | awk '{ print $1 }' | grep perl | xargs dnf -y install && \
wget --no-check-certificate -O - http://cpanmin.us | perl - App::cpanminus && \
python2 -m pip install --upgrade pip && \
python3 -m pip install --upgrade pip && \
python3 -m pip install butterfly && \
python3 -m pip install libsass && \
python3 -m pip install gitsome && \
cpanm Convert::Base32 && \
rpm -Uv https://github.com/htacg/tidy-html5/releases/download/5.2.0/tidy-5.2.0-64bit.rpm && \
ln -s /usr/local/bin/cpanm /usr/bin/cpanm && \
/usr/local/bin/cpanm App::cpanoutdated && \
/usr/local/bin/cpanm Time::Stamp && \
ln -s /usr/lib64/libtinfo.so.6 /usr/lib64/libtinfo.so.5 && ldconfig && \
curl -sSL -o dotnet.tar.gz https://go.microsoft.com/fwlink/?LinkID=816869 && \
mkdir -p /opt/dotnet && tar zxf dotnet.tar.gz -C /opt/dotnet && \
ln -s /opt/dotnet/dotnet /usr/local/bin && \
python3 -m pip install argparse backports.ssl-match-hostname click prettytable prompt-toolkit requests six slackclient wcwidth websocket-client pygments && \
python3 -m pip install powerline-status && \
dnf -y update && \
dnf clean all && \
cat /usr/lib/python3.5/site-packages/butterfly/sass/_term_styles.sass | grep -v "@extend .underline" > /tmp/_term_styles.sass && \
cat /tmp/_term_styles.sass > /usr/lib/python3.5/site-packages/butterfly/sass/_term_styles.sass && \
rm -fr /var/log/dnf* && \
rm -fr /tmp/* && rm -fr /tmp/.??*

ENTRYPOINT ["/bin/bash"]

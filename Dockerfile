FROM fedora:24

RUN ln -sf /usr/share/zoneinfo/Europe/Brussels /etc/localtime && \
dnf -y install vim telnet sl wget xz bzip2 zip tar curl iputils nmap nmap-ncat tmux fish zsh htop python-pip git nc libffi gcc libffi-devel perl-Perl-Critic-More.noarch python-devel automake gcc gcc-c++ kernel-devel cmake redhat-rpm-config openssl-devel vim bind-utils glibc-common glibc-langpack-en procps-ng git libjpeg-turbo-devel python-devel python3-devel ncurses-devel fish man-db man libtool && \
dnf -y install vim-jedi vim-perl-support vim-powerline vim-filesystem.x86_64 vim-go vim-latex-doc vim-pysmell vim-clustershell vim-taglist vim-minimal.x86_64 vim-javabrowser vim-nerdtree vimpal.x86_64 vim-X11.x86_64 vim-latex vim-common.x86_64 vim-vimoutliner vim-omnicppcomplete vim-gtk-syntax vim-enhanced vim-commentary vim-command-t vim-rnv vim-halibut vim-fugitive && \
dnf search perl-Digest | awk '{ print $1 }' | grep perl | xargs dnf -y install && \
dnf -y install perl-Authen-OATH perl-Data-GUID perl-ExtUtils-Manifest perl-ExtUtils-MakeMaker && \
wget --no-check-certificate -O - http://cpanmin.us | perl - App::cpanminus && \
pip install --upgrade pip && \
python3 -m pip install --upgrade pip && \
pip install butterfly && \
pip install libsass && \
python3 -m pip install gitsome && \
python3 -m pip install Pillow && \
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
dnf clean all

ENTRYPOINT ["/bin/bash"]

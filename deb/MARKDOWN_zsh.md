
                         
    ######  ####  #    # 
        #  #      #    # 
       #    ####  ###### 
      #         # #    # 
     #     #    # #    # 
    ######  ####  #    # 
                         

**Package:** zsh  
**Version:** 5.9-8+b24  
**Priority:** optional  
**Section:** shells  
**Source:** zsh (5.9-8)  
**Maintainer:** Debian Zsh Maintainers <pkg-zsh-devel@lists.alioth.debian.org>  
**Installed-Size:** 2 561 kB  
**Depends:** zsh-common (= 5.9-8), libc6 (>= 2.38), libcap2 (>= 1:2.10), libtinfo6 (>= 6), debianutils (>= 5.3-1~)  
**Recommends:** libgdbm6t64 (>= 1.16), libncursesw6 (>= 6), libpcre2-8-0 (>= 10.22)  
**Suggests:** zsh-doc  
**Homepage:** https://www.zsh.org/  
**Tag:** devel::interpreter, implemented-in::c, interface::shell,  
 network::client, protocol::ftp, role::program, scope::utility  
**Download-Size:** 915 kB  
**APT-Sources:** http://deb.debian.org/debian trixie/main amd64 Packages  
**Description:** командная оболочка с большим набором возможностей  
 Zsh — это командный интерпретатор UNIX (shell), используемый как  
 интерактивная оболочка и как оболочка для интерпретатора командных  
 сценариев. Из стандартных оболочек zsh наиболее близок к ksh, но  
 содержит множество расширений. Zsh позволяет редактировать командную  
 строку, имеет встроенную проверку правописания, программируемое дополнение  
 команд, функции оболочки (с автозагрузкой), механизм истории и много  
 других возможностей.  
  

# Структура пакета

    my_data
    └── usr
        ├── bin
        │   ├── rzsh -> zsh
        │   ├── zsh
        │   └── zsh5
        ├── lib
        │   └── x86_64-linux-gnu
        └── share
            ├── bug
            ├── debianutils
            ├── doc
            ├── lintian
            └── man
    
    11 directories, 3 files

## Файл Preinst

    #!/bin/sh
    set -e
    # Automatically added by dh_installdeb/13.24.2
    dpkg-maintscript-helper symlink_to_dir /usr/share/doc/zsh zsh-common 5.0.7-3 -- "$@"
    # End automatically added section

## Файл Postinst

    #!/bin/sh
    
    set -e
    
    # ksh alternatives
    update-alternatives --remove ksh /usr/bin/zsh
    update-alternatives --remove ksh /bin/zsh4
    
    # Remove alternatives system for zsh in general
    update-alternatives --remove zsh /bin/zsh5
    update-alternatives --remove rzsh /bin/zsh5
    
    case "$1" in
        (configure)
        ;;
        (abort-upgrade|abort-remove|abort-deconfigure)
    	exit 0
        ;;
        (*)
    	echo "postinst called with unknown argument \`$1'" >&2
    	exit 0
        ;;
    esac
    
    # Automatically added by dh_installdeb/13.24.2
    dpkg-maintscript-helper symlink_to_dir /usr/share/doc/zsh zsh-common 5.0.7-3 -- "$@"
    # End automatically added section
    
    
    exit 0

## Файл Prerm

    #!/bin/sh
    set -e
    # Automatically added by dh_installdeb/13.24.2
    dpkg-maintscript-helper symlink_to_dir /usr/share/doc/zsh zsh-common 5.0.7-3 -- "$@"
    # End automatically added section

## Файл Postrm

    #!/bin/sh
    set -e
    # Automatically added by dh_installdeb/13.24.2
    dpkg-maintscript-helper symlink_to_dir /usr/share/doc/zsh zsh-common 5.0.7-3 -- "$@"
    # End automatically added section


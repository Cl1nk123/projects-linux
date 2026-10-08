
                   
     ####  # ##### 
    #    # #   #   
    #      #   #   
    #  ### #   #   
    #    # #   #   
     ####  #   #   
                   

**Package:** git  
**Version:** 1:2.47.3-0+deb13u1  
**Priority:** optional  
**Section:** vcs  
**Maintainer:** Jonathan Nieder <jrnieder@gmail.com>  
**Installed-Size:** 50,3 MB  
**Provides:** git-completion, git-core  
**Depends:** libc6 (>= 2.38), libcurl3t64-gnutls (>= 7.56.1), libexpat1 (>= 2.0.1), libpcre2-8-0 (>= 10.34), zlib1g (>= 1:1.2.2), perl, liberror-perl, git-man (>> 1:2.47.3), git-man (<< 1:2.47.3-.)  
**Recommends:** ca-certificates, patch, less, ssh-client  
**Suggests:** gettext-base, git-doc, git-email, git-gui, gitk, gitweb, git-cvs, git-mediawiki, git-svn  
**Breaks:** bash-completion (<< 1:1.90-1), cogito (<= 0.18.2+), dgit (<< 5.1~), git-buildpackage (<< 0.6.5), git-el (<< 1:2.32.0~rc2-1~), gitosis (<< 0.2+20090917-7), gitpkg (<< 0.15), guilt (<< 0.33), openssh-client (<< 1:6.8), stgit (<< 0.15), stgit-contrib (<< 0.15)  
**Homepage:** https://git-scm.com/  
**Tag:** devel::lang:perl, devel::library, devel::rcs, implemented-in::c,  
 implemented-in::perl, implemented-in::shell, interface::text-mode,  
 network::client, network::server, protocol::ssh, protocol::tcp,  
 role::devel-lib, role::program, works-with::file,  
 works-with::software:source, works-with::vcs  
**Download-Size:** 8 862 kB  
**APT-Manual-Installed:** yes  
**APT-Sources:** http://deb.debian.org/debian trixie/main amd64 Packages  
**Description:** масштабируемая распределённая система контроля версий  
 Git — это популярная система контроля версий, предназначенная для быстрой и  
 эффективной работы над очень большими проектами; используется многими  
 проектами с открытым исходным кодом, самым заметным из которых является  
 ядро Linux.  
 .  
 Git является распределённой системой контроля версий: для работы с ней не  
 нужен центральный сервер. Репозитории хранятся локально полностью, со всей  
 историей изменений, а соединение с центральным сервером (если такой  
 имеется) нужно только для публикации своих изменений и загрузки изменений  
 опубликованных другими (т.е. для синхронизации удалённого и локального  
 репозиториев).  
 .  
 Этот пакет устанавливает основные компоненты git. Дополнительные  
 компоненты, такие как графический интерфейс пользователя и утилита для  
 наглядного представления дерева версий, утилиты для организации  
 взаимодействия с другими системами контроля версий и веб-интерфейс,  
 доступны в отдельных пакетах git*.  
  

# Структура пакета

    my_data
    ├── etc
    │   └── bash_completion.d
    │       └── git-prompt
    ├── usr
    │   ├── bin
    │   │   ├── git
    │   │   ├── git-receive-pack -> git
    │   │   ├── git-shell
    │   │   ├── git-upload-archive -> git
    │   │   ├── git-upload-pack -> git
    │   │   └── scalar
    │   ├── lib
    │   │   └── git-core
    │   └── share
    │       ├── bash-completion
    │       ├── doc
    │       ├── git-core
    │       ├── gitweb
    │       ├── lintian
    │       ├── locale
    │       └── perl5
    └── var
        └── lib
            └── git
    
    18 directories, 7 files

## Файл Preinst

    #!/bin/sh
    set -e
    
    # Automatically added by dh_installdeb/13.24.2
    dpkg-maintscript-helper rm_conffile /etc/bash_completion.d/git 1:1.8.0-1\~ -- "$@"
    # End automatically added section
    
    
    # /var/cache/git/ -> /var/lib/git/ transition
    if test "$1" = upgrade &&
       dpkg --compare-versions "$2" lt-nl '1:1.8.4~rc0-1'; then
    	mkdir -m 755 -p /var/lib/git
    	(
    		cd /var/lib/git
    		for target in ../../cache/git/*; do
    			if ! test -L "$target" && ! test -e "$target"; then
    				continue
    			fi
    
    			link=${target#../../cache/git/}
    			if ! test -L "$link" && ! test -e "$link"; then
    				ln -s "$target" "$link"
    			fi
    		done
    	)
    fi
    
    # A previous version of the /var/lib/git/ transition code
    # left behind a symlink '/var/lib/git/*' -> '../../cache/git/*'.
    if test "$1" = upgrade &&
       dpkg --compare-versions "$2" eq '1:1.8.4~rc0-1' &&
       test -L '/var/lib/git/*'; then
    	target=$(readlink '/var/lib/git/*')
    	if test "$target" = '../../cache/git/*'; then
    		rm -f '/var/lib/git/*'
    	fi
    fi

## Файл Postinst

    #!/bin/sh
    set -e
    # Automatically added by dh_installdeb/13.24.2
    dpkg-maintscript-helper rm_conffile /etc/bash_completion.d/git 1:1.8.0-1\~ -- "$@"
    # End automatically added section

## Файл Prerm

    #!/bin/sh
    set -e
    # Automatically added by dh_installdeb/13.24.2
    dpkg-maintscript-helper rm_conffile /etc/bash_completion.d/git 1:1.8.0-1\~ -- "$@"
    # End automatically added section

## Файл Postrm

    #!/bin/sh
    set -e
    # Automatically added by dh_installdeb/13.24.2
    dpkg-maintscript-helper rm_conffile /etc/bash_completion.d/git 1:1.8.0-1\~ -- "$@"
    # End automatically added section


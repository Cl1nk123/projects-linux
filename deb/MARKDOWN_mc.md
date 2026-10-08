
                  
    #    #  ####  
    ##  ## #    # 
    # ## # #      
    #    # #      
    #    # #    # 
    #    #  ####  
                  

**Package:** mc  
**Version:** 3:4.8.33-1+deb13u1  
**Priority:** optional  
**Section:** utils  
**Maintainer:** Dmitry Smirnov <onlyjob@debian.org>  
**Installed-Size:** 1 628 kB  
**Provides:** mcedit  
**Depends:** libc6 (>= 2.38), libext2fs2t64 (>= 1.37), libglib2.0-0t64 (>= 2.78.0), libgpm2 (>= 1.20.7), libslang2 (>= 2.2.4), libssh2-1t64 (>= 1.2.8), mc-data (= 3:4.8.33-1+deb13u1)  
**Recommends:** mailcap, perl, sensible-utils, unzip  
**Suggests:** antiword, arc | arcanist, arj, binutils, bzip2, cabextract, catdoc, texlive-binaries, clzip | lunzip | lzd | lzip | lziprecover | minilzip | pdlzip | plzip, cpio, ctorrent, dbview, default-jdk-headless, djview4, djvulibre-bin, elinks, epub-utils | ncbi-entrez-direct, exif, file, genisoimage, gettext, ghostscript, glade, gputils, groff-base, gv, imagemagick, info, jlha-utils | lhasa, kchmviewer, libaspell-dev, libbatik-java, libchm-bin, liblz4-tool, libxml2-utils, links2, links | w3m | lynx, lyx, xz-utils, man-db, mikmod, mpg321, mplayer, odt2txt | unoconv, p7zip-full, par2, poedit | potool, poppler-utils, procyon-decompiler, python3:any, python3-boto, python3-tz, rar, rpm, sox, sqlite3, timidity, unace | unace-nonfree, unalz, unar, unrar | unrar-free, vorbis-tools, wimtools, wv, xpdf | pdf-viewer, xpmutils, zip, zstd  
**Homepage:** https://www.midnight-commander.org  
**Tag:** admin::filesystem, devel::lang:perl, devel::library, implemented-in::c,  
 implemented-in::perl, interface::commandline, interface::text-mode,  
 role::devel-lib, role::program, scope::application, scope::utility,  
 suite::gnu, uitoolkit::ncurses, use::browsing, use::editing,  
 use::organizing, works-with::archive, works-with::file  
**Download-Size:** 550 kB  
**APT-Manual-Installed:** yes  
**APT-Sources:** http://deb.debian.org/debian trixie/main amd64 Packages  
**Description:** Midnight Commander - многофункциональный диспетчер файлов  
 GNU Midnight Commander – полноэкранный текстовый файловый менеджер.  
 В нём используется двухпанельный интерфейс и встроенная командная оболочка.  
 Также имеется встроенный редактор с подсветкой синтаксиса и просмотрщик,  
 поддерживающий двоичные файлы. Программа поддерживает виртуальную файловую  
 систему (VFS), что позволяет работать с файлами на удалённых машинах  
 (например, на серверах FTP, SSH) и с файлами внутри архивов,  
 как с обычными файлами.  
  

# Структура пакета

    my_data
    ├── etc
    │   └── mc
    │       ├── edit.indent.rc
    │       ├── filehighlight.ini
    │       ├── mc.default.keymap
    │       ├── mcedit.menu
    │       ├── mc.emacs.keymap
    │       ├── mc.ext.ini
    │       ├── mc.keymap -> mc.default.keymap
    │       ├── mc.menu
    │       ├── mc.vim.keymap
    │       └── sfs.ini
    └── usr
        ├── bin
        │   ├── mc
        │   ├── mcdiff -> mc
        │   ├── mcedit -> mc
        │   └── mcview -> mc
        ├── lib
        │   └── mc
        └── share
            ├── applications
            ├── doc
            ├── lintian
            ├── mc
            └── pixmaps
    
    13 directories, 14 files

## Файл Preinst

    #!/bin/sh
    set -e
    # Automatically added by dh_installdeb/13.24.2
    dpkg-maintscript-helper rm_conffile /etc/mc/edit.spell.rc 3:4.8.5-1 -- "$@"
    dpkg-maintscript-helper rm_conffile /etc/mc/mc.charsets 3:4.8-1 -- "$@"
    dpkg-maintscript-helper rm_conffile /etc/mc/mc.ext 3:4.8.29-2 -- "$@"
    dpkg-maintscript-helper rm_conffile /etc/mc/mc.lib 3:4.8-1 -- "$@"
    dpkg-maintscript-helper rm_conffile /etc/mc/mc.menu.sr 3:4.8.17-0 -- "$@"
    dpkg-maintscript-helper rm_conffile /etc/mc/Syntax 3:4.8-1 -- "$@"
    dpkg-maintscript-helper mv_conffile /etc/mc/cedit.menu /etc/mc/mcedit.menu 3:4.8-1 -- "$@"
    dpkg-maintscript-helper mv_conffile /etc/mc/mc.keymap.emacs /etc/mc/mc.emacs.keymap 3:4.8.8-0 -- "$@"
    dpkg-maintscript-helper mv_conffile /etc/mc/mc.keymap.default /etc/mc/mc.default.keymap 3:4.8.8-0 -- "$@"
    # End automatically added section

## Файл Postinst

    #!/bin/sh
    set -e
    
    case "$1" in
    	configure|abort-upgrade)
    		update-alternatives --install /usr/bin/view view /usr/bin/mcview 25 \
    			--slave /usr/share/man/man1/view.1.gz view.1.gz /usr/share/man/man1/mcview.1.gz
    		update-alternatives --install /usr/bin/editor editor /usr/bin/mcedit 25 \
    			--slave /usr/share/man/man1/editor.1.gz editor.1.gz /usr/share/man/man1/mcedit.1.gz
    	;;
    esac
    
    # Automatically added by dh_installdeb/13.24.2
    dpkg-maintscript-helper rm_conffile /etc/mc/edit.spell.rc 3:4.8.5-1 -- "$@"
    dpkg-maintscript-helper rm_conffile /etc/mc/mc.charsets 3:4.8-1 -- "$@"
    dpkg-maintscript-helper rm_conffile /etc/mc/mc.ext 3:4.8.29-2 -- "$@"
    dpkg-maintscript-helper rm_conffile /etc/mc/mc.lib 3:4.8-1 -- "$@"
    dpkg-maintscript-helper rm_conffile /etc/mc/mc.menu.sr 3:4.8.17-0 -- "$@"
    dpkg-maintscript-helper rm_conffile /etc/mc/Syntax 3:4.8-1 -- "$@"
    dpkg-maintscript-helper mv_conffile /etc/mc/cedit.menu /etc/mc/mcedit.menu 3:4.8-1 -- "$@"
    dpkg-maintscript-helper mv_conffile /etc/mc/mc.keymap.emacs /etc/mc/mc.emacs.keymap 3:4.8.8-0 -- "$@"
    dpkg-maintscript-helper mv_conffile /etc/mc/mc.keymap.default /etc/mc/mc.default.keymap 3:4.8.8-0 -- "$@"
    # End automatically added section
    

## Файл Prerm

    #!/bin/sh
    set -e
    
    case "$1" in
    	remove)
    		update-alternatives --remove editor /usr/bin/mcedit
    		update-alternatives --remove view /usr/bin/mcview
    	;;
    esac
    
    # Automatically added by dh_installdeb/13.24.2
    dpkg-maintscript-helper rm_conffile /etc/mc/edit.spell.rc 3:4.8.5-1 -- "$@"
    dpkg-maintscript-helper rm_conffile /etc/mc/mc.charsets 3:4.8-1 -- "$@"
    dpkg-maintscript-helper rm_conffile /etc/mc/mc.ext 3:4.8.29-2 -- "$@"
    dpkg-maintscript-helper rm_conffile /etc/mc/mc.lib 3:4.8-1 -- "$@"
    dpkg-maintscript-helper rm_conffile /etc/mc/mc.menu.sr 3:4.8.17-0 -- "$@"
    dpkg-maintscript-helper rm_conffile /etc/mc/Syntax 3:4.8-1 -- "$@"
    dpkg-maintscript-helper mv_conffile /etc/mc/cedit.menu /etc/mc/mcedit.menu 3:4.8-1 -- "$@"
    dpkg-maintscript-helper mv_conffile /etc/mc/mc.keymap.emacs /etc/mc/mc.emacs.keymap 3:4.8.8-0 -- "$@"
    dpkg-maintscript-helper mv_conffile /etc/mc/mc.keymap.default /etc/mc/mc.default.keymap 3:4.8.8-0 -- "$@"
    # End automatically added section
    

## Файл Postrm

    #!/bin/sh
    set -e
    
    case "$1" in
    	purge)
    
    		rm -f \
    			/etc/mc/cedit.menu \
    			/etc/mc/*.ini \
    			/etc/mc/mc.* \
    			/etc/mc/*.rc \
    			/etc/mc/Syntax
    
    		rmdir /etc/mc 2>/dev/null || true
    
    	;;
    esac
    
    # Automatically added by dh_installdeb/13.24.2
    dpkg-maintscript-helper rm_conffile /etc/mc/edit.spell.rc 3:4.8.5-1 -- "$@"
    dpkg-maintscript-helper rm_conffile /etc/mc/mc.charsets 3:4.8-1 -- "$@"
    dpkg-maintscript-helper rm_conffile /etc/mc/mc.ext 3:4.8.29-2 -- "$@"
    dpkg-maintscript-helper rm_conffile /etc/mc/mc.lib 3:4.8-1 -- "$@"
    dpkg-maintscript-helper rm_conffile /etc/mc/mc.menu.sr 3:4.8.17-0 -- "$@"
    dpkg-maintscript-helper rm_conffile /etc/mc/Syntax 3:4.8-1 -- "$@"
    dpkg-maintscript-helper mv_conffile /etc/mc/cedit.menu /etc/mc/mcedit.menu 3:4.8-1 -- "$@"
    dpkg-maintscript-helper mv_conffile /etc/mc/mc.keymap.emacs /etc/mc/mc.emacs.keymap 3:4.8.8-0 -- "$@"
    dpkg-maintscript-helper mv_conffile /etc/mc/mc.keymap.default /etc/mc/mc.default.keymap 3:4.8.8-0 -- "$@"
    # End automatically added section
    


echo "Markdown отчёт для пакета $1"

apt download $1

FILE_NAME=$(ls $1_*.deb)

mkdir -p my_data my_META
dpkg -x "$FILE_NAME" my_data
dpkg -e "$FILE_NAME" my_META

text="
$(figlet -f banner $1 | sed 's/^/    /')

$(apt show $1 2>/dev/null | sed 's/$/  /' | sed -E 's/(^\b.+?:) /**\1** /g')

# Структура пакета

$(tree -L 3 my_data | sed 's/^/    /')

## Файл Preinst

$(sed 's/^/    /' my_META/preinst 2>/dev/null)

## Файл Postinst

$(sed 's/^/    /' my_META/postinst 2>/dev/null)

## Файл Prerm

$(sed 's/^/    /' my_META/prerm 2>/dev/null)

## Файл Postrm

$(sed 's/^/    /' my_META/postrm 2>/dev/null)
"

echo "$text" > "MARKDOWN_$1.md"

rm -rf "$FILE_NAME" my_data my_META

echo "Готово: MARKDOWN_$1.md"
exit 0

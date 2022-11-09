#!/bin/bash




dir="/volume1/HD_Production/playout"      # папка

dnei="7"          # файлы старше этого количесьва дней - удаляем

# список исключений
NE_Ydalaem="      
INDEX_NEDELY_4.mxf.xmp
humbs.db
"



IFS=$'\n'
data2=`date +"%s"`

for file in $(find "$dir" -type f -mtime +$dnei); do

	name=${file##*/}
	test_filtr=$(echo $NE_Ydalaem | grep $name)
		if [ "$test_filtr" ]; then
			echo " + OCTAVLAEM: (fail в исключении):  $name"
		else
			echo " -   YDALЯEM: (faily bolwe $dnei dnei):  $name"
			rm $file
			
		
		fi
done

exit 0

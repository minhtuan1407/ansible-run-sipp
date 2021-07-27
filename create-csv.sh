#!/bin/bash

extensions_start=$1
extensions_end=$2

echo -e "SEQUENTIAL;;;\n#user;domain;authentication;" > template/$extensions_start-$extensions_end.csv.j2
for (( i=$extensions_start; i<=$extensions_end; i++ ))
do
        echo -e "$i;{{ domain_uri }};[authentication username=$i password={{ password_extensions }}];" >> template/$extensions_start-$extensions_end.csv.j2
done

echo -e "SEQUENTIAL;;;\n#user;domain;authentication;destination;" > template/$extensions_start-$extensions_end-0XXXXXXXXX.csv.j2
if [ ${#extensions_start} = 1 ] && [ ${#extensions_end} = 1 ]; then
        for (( i=$extensions_start; i<=$extensions_end; i++ ))
        do
                echo -e "$i;{{ domain_uri }};[authentication username=$i password={{ password_extensions }}];099999999$i;" >> template/$extensions_start-$extensions_end-0XXXXXXXXX.csv.j2
        done
fi

if [ ${#extensions_start} = 2 ] && [ "${#extensions_end}" = 2 ]; then
        for (( i=$extensions_start; i<=$extensions_end; i++ ))
        do
                echo -e "$i;{{ domain_uri }};[authentication username=$i password={{ password_extensions }}];09999999$i;" >> template/$extensions_start-$extensions_end-0XXXXXXXXX.csv.j2
        done
fi

if [ "${#extensions_start}" = 3 ] && [ "${#extensions_end}" = 3 ]; then
        for (( i=$extensions_start; i<=$extensions_end; i++ ))
        do
                echo -e "$i;{{ domain_uri }};[authentication username=$i password={{ password_extensions }}];0999999$i;" >> template/$extensions_start-$extensions_end-0XXXXXXXXX.csv.j2
        done
fi

if [ "${#extensions_start}" = 4 ] && [ "${#extensions_end}" = 4 ]; then
        for (( i=$extensions_start; i<=$extensions_end; i++ ))
        do
                echo -e "$i;{{ domain_uri }};[authentication username=$i password={{ password_extensions }}];099999$i;" >> template/$extensions_start-$extensions_end-0XXXXXXXXX.csv.j2
        done
fi

if [ "${#extensions_start}" = 5 ] && [ "${#extensions_end}" = 5 ]; then
        for (( i=$extensions_start; i<=$extensions_end; i++ ))
        do
                echo -e "$i;{{ domain_uri }};[authentication username=$i password={{ password_extensions }}];09999$i;" >> template/$extensions_start-$extensions_end-0XXXXXXXXX.csv.j2
        done
fi

if [ "${#extensions_start}" = 6 ] && [ "${#extensions_end}" = 6 ]; then
        for (( i=$extensions_start; i<=$extensions_end; i++ ))
        do
                echo -e "$i;{{ domain_uri }};[authentication username=$i password={{ password_extensions }}];0999$i;" >> template/$extensions_start-$extensions_end-0XXXXXXXXX.csv.j2
        done
fi

if [ "${#extensions_start}" = 7 ] && [ "${#extensions_end}" = 7 ]; then
        for (( i=$extensions_start; i<=$extensions_end; i++ ))
        do
                echo -e "$i;{{ domain_uri }};[authentication username=$i password={{ password_extensions }}];099$i;" >> template/$extensions_start-$extensions_end-0XXXXXXXXX.csv.j2
        done
fi

if [ "${#extensions_start}" = 8 ] && [ "${#extensions_end}" = 8 ]; then
        for (( i=$extensions_start; i<=$extensions_end; i++ ))
        do
                echo -e "$i;{{ domain_uri }};[authentication username=$i password={{ password_extensions }}];09$i;" >> template/$extensions_start-$extensions_end-0XXXXXXXXX.csv.j2
        done
fi

if [ "${#extensions_start}" = 9 ] && [ "${#extensions_end}" = 9 ]; then
        for (( i=$extensions_start; i<=$extensions_end; i++ ))
        do
                echo -e "$i;{{ domain_uri }};[authentication username=$i password={{ password_extensions }}];0$i;" >> template/$extensions_start-$extensions_end-0XXXXXXXXX.csv.j2
        done
fi

#!/bin/bash
PREFIX=`curl "http://10.20.30.17:8500/v1/kv/?keys&seperator=/" | jq '.' | grep "e2e-" | sed -e 's/"//g' -e 's,/,,g' -e 's/,//g' -e 's/^  //g'`
echo $PREFIX
URI_PREFIX="http://10.20.30.17:8500/v1/kv"
EXCLUSION="e2e-653f2-3388-1 e2e-653f2-3388-2 e2e-653f2-3388-3"
for i in $PREFIX ; do
        if [[ $EXCLUSION =~ $i ]] ; then
                echo "skipping: $i"
                continue
        else
                echo "deleting $i"
                curl -X DELETE "${URI_PREFIX}/$i?recurse";
        fi
done;

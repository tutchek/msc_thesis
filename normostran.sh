#!/bin/bash

znaku=`wc -m chaps/*.tex | tail -n 1 | sed "s~  *~ ~" | sed "s~^ ~~" | cut -d " " -f 1`

normostran=`expr $znaku / 1800`

echo "Znaku: $znaku, normostran: $normostran"

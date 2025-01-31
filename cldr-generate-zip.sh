#!/bin/bash
# 
#     Copyright © 1991-2020 Unicode, Inc. All rights reserved. Distributed under
# the Terms of Use in http://www.unicode.org/copyright.html.
#
# Creates JSON data under ./cldr-json in this directory.

. ./cldr-config.sh
if [ -x ./local-config.sh ];
then
    echo "Using local-config.sh"
    . ./local-config.sh
fi

set -x
( cd ${OUT} && cp ../LICENSE LICENSE )
( cd ${OUT} && zip -r cldr-${VERSION}-json-full.zip LICENSE cldr-core cldr-rbnf cldr-*-full cldr-bcp47 )
( cd ${OUT} && zip -r cldr-${VERSION}-json-modern.zip LICENSE cldr-core cldr-rbnf cldr-*-modern cldr-bcp47 )
( cd ${OUT} && rm LICENSE )

mv -v ${OUT}/*.zip ${DIST}/

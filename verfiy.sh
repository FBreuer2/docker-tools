#!/bin/sh
###
# Checks if a signature file exists and tries to validate it
# otherwise generates the signature file.
# Here are all variables:
#
# $DOCKER_VERIFY_CHECKSUM_FILE  - name of the checksum file
#
# $DOCKER_TAG                   - tag (name) of the project/build
#
# $DOCKER_ID                    - ID for this particular build
###

if [ -f $DOCKER_VERIFY_CHECKSUM_FILE ]; then
    sha256sum --quiet -c $DOCKER_VERIFY_CHECKSUM_FILE > $DOCKER_TAG-$DOCKER_INSTANCE_ID-verify.log
    echo "Check the verification log at "$DOCKER_TAG-$DOCKER_INSTANCE_ID-verify.log
else
    sha256sum * > $DOCKER_VERIFY_CHECKSUM_FILE
    echo "Calculated hash values and saved it in "$DOCKER_VERIFY_CHECKSUM_FILE
fi

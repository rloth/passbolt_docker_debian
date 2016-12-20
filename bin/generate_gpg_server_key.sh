#!/bin/sh

DIRNAME=`dirname $0`/..
gpg --batch --armor --gen-key $DIRNAME/passbolt_image/conf/gpg_server_key_settings.conf
mv $DIRNAME/gpg_server_key_public.key $DIRNAME/passbolt_image/conf
mv $DIRNAME/gpg_server_key_private.key $DIRNAME/passbolt_image/conf

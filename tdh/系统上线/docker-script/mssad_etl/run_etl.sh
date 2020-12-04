#!/bin/bash

SCRIPT_BASE_PATH=`dirname $0`



/bin/bash $SCRIPT_BASE_PATH/mssad_grant/run_mssad_grant.sh
/bin/bash $SCRIPT_BASE_PATH/mssad_proc/run_create_proc.sh



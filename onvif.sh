#!/bin/bash

###############################################################################
#   Settings
###############################################################################
BASE_URL="onvif/device_service"
TEMPLATE_FOLDER="./templates"
LOG_FILE="/dev/null"

###############################################################################
#   Variables
###############################################################################
SCHEMA=http
HOST=
PORT=
USER=
PASS=

ACTION=

POSITIONAL=
VERBOSE=0

me="$0"
echo $0 $*
me_name=$(basename $me)
me_folder=$(dirname $me)
date_f=$(date)
ts=$(date -d "$date_f" +%s)
date_s=$(date -d "$date_f" +%Y-%m-%d)
date_ss=$(date -d "$date_f" +%Y-%m-%d_%H-%M-%S)

HELP=0
###############################################################################
#   Pars Args
###############################################################################
# Parse ARGS BEGIN
while [[ $# -gt 0 ]]
do
    key="$1"

    case $key in
    -h|--host)
        HOST="$2"
        shift # past argument
        shift # past value
    ;;
    -p|--port)
        PORT="$2"
        shift # past argument
        shift # past value
    ;;
    -u|--user)
        USER="$2"
        shift # past argument
        shift # past value
    ;;
    -P|--pass)
        PASS="$2"
        shift # past argument
        shift # past value
    ;;
    -s|--schema)
        SCHEMA="$2"
        shift # past argument
        shift # past value
    ;;
    -a|--action)
        ACTION="$2"
        shift # past argument
        shift # past value
    ;;
    -H|--help)
        HELP=1
        shift
    ;;
    -v|--verbose)
        VERBOSE=1
        shift
    ;;
    -vv)
        VERBOSE=2
        shift
    ;;
    --*)
        var_name=${key#"--"}
        declare ${var_name}=$2
        echo "$var_name => ${!var_name}"
        shift # past argument
        shift # past value
    ;;
    *)
        POSITIONAL+=("$1")
        shift # past argument
    ;;
    esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters
# Parse ARGS END

if [ -z "$HOST" ]; then
    echo "Host (-h|--host) is mandatory"
    exit -1
fi
if [ -z "$PORT" ]; then
    echo "Port (-p|--port) is mandatory"
    exit -1
fi
if [ -z "$USER" ]; then
    echo "User (-u|--user) is mandatory"
    exit -1
fi
if [ -z "$PASS" ]; then
    echo "Pass (-P|--pass) is mandatory"
    exit -1
fi
if [ -z "$ACTION" ]; then
    echo "Action (-a|--action) is mandatory"
    exit -1
fi

PTZ_URL="${SCHEMA}://${HOST}:${PORT}"

source './log.func'
source './helpers.func'
source './actions.func'

###############################################################################
#   Functions
###############################################################################
function run_action() {
    # Check if action exists
    if [ "$(type -t ${ACTION})" == "function" ]; then
        t_log "Running $ACTION from function"
        $ACTION
    elif [ -f "actions.d/${ACTION}.func" ]; then
        echo "Running Action file actions.d/${ACTION}.func"
        source "actions.d/${ACTION}.func"
        $ACTION
    elif [ -f "templates/${ACTION}.xml" ]; then
        echo Running action from template file "templates/${ACTION}.xml"
        if [ $HELP -eq 1 ]; then
            egrep -o -e "\\\$[A-Za-z_]*" templates/${ACTION}.xml
        else
            execute_template $ACTION
        fi
    else
        echo No action $ACTION found!
    fi
        
}
###############################################################################
#   Main
###############################################################################
t_log "Running $ACTION..."
s_log
run_action
s_log
t_log "$ACTION finished with code $?"
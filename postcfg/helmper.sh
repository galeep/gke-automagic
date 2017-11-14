#!/bin/bash

# TODO: pin versions, pass args
# Not intended to be run by a human 

# Deploy everything to a given namespace so we can zap it
nsts="`date "+%s"`"

function helmit() {
    _app="${1}"
    _ts="`date "+%s"`"
    if [ "${_app}" == "" ]; then 
        echo "Could not find app of the name: \`${_app}'"
        exit 1
    fi
    if [ ! -f "${_app}/values.yaml" ]; then 
        # try to download it 
        _fetchhelm=`helm fetch --untar "stable/${_app}"`
        _fstatus=$?
        if [[ "${_fstatus}" != "0" || ! -f "${_app}/values.yaml" ]]; then 
           echo "ERROR: No ${_app}/values.yaml and could not get one"
           exit 1
        fi
    fi
    #_runhelm="`helm install --name "${_ts}" \
    #    -f "${_app}/values.yaml" "stable/${_app}"`"
    _runhelm="`helm install --namespace "${nsts}" -f "${_app}/values.yaml" "stable/${_app}"`"

    _appstatus=$?
    if [ "${_appstatus}" != "0" ]; then 
        echo "Couldn't install app \`${_app}':"
        echo "${_runhelm}" 
        exit 1
    fi
    echo ${_runhelm}
} 

helmit kube-lego
helmit wordpress

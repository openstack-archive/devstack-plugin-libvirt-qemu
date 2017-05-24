#!/bin/bash

#local xtrace=$(set +o | grep xtrace)

if [ "$VERBOSE" == 'True' ]; then
    # enabling verbosity on whole plugin - default behavior
    set -o xtrace
fi

local error_on_clone=${ERROR_ON_CLONE}
# disabling ERROR_NO_CLONE to allow this plugin work with devstack-gate
ERROR_ON_CLONE=False

    # Initial source of lib script
    source $DEVSTACK_LIBVIRT_QEMU_PLUGIN_DIR/devstack/libs/libvirt

    case $1 in
        "stack")
            case $2 in
                "pre-install")
                    # cloning source code
                    if [ $LIBVIRT_QEMU_SRC_INSTALL == 'True' ]; then
                        echo_summary "Downloading source repos for libvirt and qemu"
                        clone_libvirt_qemu
                    else
                        echo_summary "Cloning of src files for libvirt and qemu disabled"
                    fi
                ;;
                "install")
                    # no-op
                    # install called via by devstack/lib/nova
                    :
                ;;
                "post-config")
                    # no-op
                    :
                ;;
                "extra")
                    # no-op
                    :
                ;;
            esac
        ;;
        "unstack")
            # Shut Down OVS-DPDK
            uninstall_libvirt_qemu
        ;;
        "clean")
            # Remove state and transient data
            # Remember clean.sh first calls unstack.sh
            cleanup_libvirt_qemu_source
        ;;
    esac

ERROR_ON_CLONE=$error_on_clone
$xtrace

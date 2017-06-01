============
Installation
============

At the command line::

    $ pip install devstack-plugin-libvirt-qemu

Or, if you have virtualenvwrapper installed::

    $ mkvirtualenv devstack-plugin-libvirt-qemu
    $ pip install devstack-plugin-libvirt-qemu


Notes
=====

``libvirt`` needs ``python-libvirt`` library to be used in OpenStack. The
version downloaded and compiled must have a compatible Python API binding
available to be installed. Check `The libvirt virtualization API python binding
<https://pypi.python.org/pypi/libvirt-python>`_ to find the list of available
versions to be installed.

This plugin has been tested manually in:

* Ubuntu 16.04
* CentOS 7

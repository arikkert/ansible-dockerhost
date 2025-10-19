playbook documentation
======================

installs and configures docker on target host with CentOS 9.
According to https://docs.docker.com/engine/install/centos/.
It will configure the target host as docker host (controlling containers) and reserves a separate partition for the container data.
Tested on https://app.vagrantup.com/bento/boxes/centos-stream-9 box.

Info
----

This implementation uses a Makefile as installation wrapper.  
Just type *make* in the directory where the Makefile is located, to install all dependencies and run the playbook.  
The makefile calls tools like *yamllint* and *ansible-lint*  
These tools are only called when found in the search path, so no problem if they are not installed.
It will add and configure a user *docker* that has elevated root privileges.  
(I forgot why that was needed, cause user *docker* gets group *docker* as supplementary group and that group has access to the docker daemon)  

Requirements
------------

Deploy host has *make*, *ansible*
Target host has CentOS 9 installed.
Requires root access to target host.   
Target host has an extra disk */dev/sdb* of at least 40 GB in size for future container data.  

Variables
--------------

Dependencies
------------

License
-------

BSD

Author Information
------------------

    ARK-ICT
    Andre Rikkert de Koe - ICT

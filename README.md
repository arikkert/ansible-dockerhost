playbook documentation
======================

installs and configures docker on target host with CentOS 7.  
installs and configures NRPE with *check_docker* that checks what containers running.  
containers to be checked should be defined as host_vars.  
It will configure the target host to use docker and reserves a separate partition for the container data

Info
----

This implementation uses a Makefile as installation wrapper.  
The makefile calls tools like *yamllint* and *ansible-lint*  
These tools are only called when found in the search path, so no problem if they are not installed.  
It will add and configure a user *docker* that has elevated root privileges.  
(I forgot why that was needed, cause user *docker* gets group *docker* as supplementary group and that group has access to the docker daemon)  
It also installs *git* and *mgitstatus*

Requirements
------------

deploy host has *ansible* and *ansible-galaxy* installed.  
Target host has CentOS 7 installed.  
Requires root access to target host.   
Requires an extra disk */dev/sdb* of at least 40 GB in size for future container data.  

Variables
--------------

Vars that can be set in inventory  
* email_root: the email of the root account, defaults to root  
* nagios: the host running nagios, defaults to nagios  

hostvars  
* *containers*: optional list of containers that should be running on target host  

These vars are used in the roles

Dependencies
------------

* role_nrpe
* role_nrpe_check_docker
* role_postfix_nullclient

License
-------

BSD

Author Information
------------------

    ARK-ICT
    Andre Rikkert de Koe - ICT

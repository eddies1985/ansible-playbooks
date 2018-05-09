Role Name
=========

this role installs collectd 

Requirements
------------

none

Role Variables
--------------
in defaults/main.yml:
coll_type: "general"

means that will put config for general usage report - collects every 300s and
sends to elk

apache - collects every 10 sec, preconfigured apache collector , sends to elk
prod - collects every 10 sec, sends to elk

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: collectd_role, coll_type: general }

License
-------

BSD

Author Information
------------------
anton@mellanox.com

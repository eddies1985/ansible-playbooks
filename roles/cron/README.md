Role Name
=========

setups cron file to run ansible-pull

Requirements
------------
cron installed

Role Variables
--------------

schedule: '0 * * * *'
cron_user: root
logfile: /var/log/ansible-pull.log
workdir: /var/spool/ansible
repo_url: "{{ repo_base }}/{{ gerrit_project }}
repo_base: http://gerrit-readonly-mtl.labs.mlnx:8080/DevOps_projects/Ansible_playbooks/
gerrit_project: "" - please define it .

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: cron_ansible_pull, gerrit_project: ansible_postinstall }

License
-------

BSD

Author Information
------------------
anton@mellanox.com

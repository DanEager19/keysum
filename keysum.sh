#!/bin/bash
./create_key.rb
ansible-playbook -u root ansible/distribute.yml

sleep 300

ansible-playbook -u root ansible/retrieve.yml
./test_keys.rb
## SRE Candidate assessment host setup

A collection of Ansible playbooks and roles that configure and setup a Ubuntu 20.04 host to run Nginx and Flask with Gunicorn. These playbooks setup a host with a misconfiguration which the SRE candidate is asked to diagnose and repair as part of their assessment.

This project requires Vagrant and Virtualbox. Setup is driven through `make`. Running `make disturb` configures gunicorn to serve requests on port 9000 instead of 8080, and stops the Nginx service. Running `make build` starts the setup process.

The candidate is presented with the scenario below; is expected to identify and remediate the misconfiguration, and return the hosts to proper working order.


### Scenario:

A server are an organization has stopped functioning properly. Your task is to repair the server. You have ssh access via the ubuntu user and the deployer user. The only notes on the server are below:

1. It's a nginx server on Ubuntu. We know gunicorn, flask redis and systemd.
1. The server used to say something like "ok" when we went to `http://10.128.32.101/health` with our browsers

### Setup Notes:

If you encounter issues cloning the repository from github, it's likely you'll have to run an ssh-agent and add your keys.

```
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

After adding your keys, ssh into the host via deployer `ssh deployer@10.128.32.101` and test your connection to github `ssh -T git@github.com`
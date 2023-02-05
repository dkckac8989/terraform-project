vagrant@ubuntu-focal:~/terraform-instance$ sudo su
root@ubuntu-focal:/home/vagrant/terraform-instance# ansible-playbbok -i host-inventory playbb.yml 

Command 'ansible-playbbok' not found, did you mean:

  command 'ansible-playbook' from deb ansible (2.9.6+dfsg-1)

Try: apt install <deb name>

root@ubuntu-focal:/home/vagrant/terraform-instance# ansible-playbook -i host-inventory playbb.yml 

PLAY [webserver] **************************************************************************************************************************************

TASK [Gathering Facts] ********************************************************************************************************************************
The authenticity of host '54.92.147.136 (54.92.147.136)' can't be established.
ECDSA key fingerprint is SHA256:uCV9QBddmbGcMFNNGhROii8b8hYbwrjEJ7VCY0/+D7c.
The authenticity of host '52.90.63.1 (52.90.63.1)' can't be established.
ECDSA key fingerprint is SHA256:8E49Po5Sa0JFSCWiLE5ZjOmZlPptbl9y+xU9Z2gSD7c.
The authenticity of host '3.80.10.89 (3.80.10.89)' can't be established.
ECDSA key fingerprint is SHA256:zpwEwKVMDnkjbs2/Tq2vyDC7BEja9CdIN/aMRmJZxJ8.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
fatal: [54.92.147.136]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: Warning: Permanently added '54.92.147.136' (ECDSA) to the list of known hosts.\r\nubuntu@54.92.147.136: Permission denied (publickey).", "unreachable": true}
^C [ERROR]: User interrupted execution
root@ubuntu-focal:/home/vagrant/terraform-instance# 
root@ubuntu-focal:/home/vagrant/terraform-instance# nano playbb.yml 
root@ubuntu-focal:/home/vagrant/terraform-instance# cd ~
root@ubuntu-focal:~# cd /etc
root@ubuntu-focal:/etc# cd ansible
root@ubuntu-focal:/etc/ansible# nano ansible.cfg
root@ubuntu-focal:/etc/ansible# cd ~
root@ubuntu-focal:~# cd terraform-instance
bash: cd: terraform-instance: No such file or directory
root@ubuntu-focal:~# cd terraform-instance
bash: cd: terraform-instance: No such file or directory
root@ubuntu-focal:~# ls -al
total 32
drwx------  6 root root 4096 Nov  3 21:14 .
drwxr-xr-x 20 root root 4096 Feb  5 21:03 ..
drwxr-xr-x  4 root root 4096 Nov  6 08:18 .ansible
-rw-r--r--  1 root root 3106 Dec  5  2019 .bashrc
drwxr-xr-x  3 root root 4096 Nov  3 20:18 .local
-rw-r--r--  1 root root  161 Dec  5  2019 .profile
drwx------  2 root root 4096 Nov  6 08:49 .ssh
drwx------  3 root root 4096 Oct 28 10:12 snap
root@ubuntu-focal:~# exit
exit
vagrant@ubuntu-focal:~/terraform-instance$ ls
ansibleforproj  host-inventory  main.tf  playbb.yml  terraform.tfstate  terraform.tfstate.backup  terrap.pem
vagrant@ubuntu-focal:~/terraform-instance$ sudo su
root@ubuntu-focal:/home/vagrant/terraform-instance# ansible-playbook -i host-inventory playbb.yml 

PLAY [webserver] **************************************************************************************************************************************

TASK [Gathering Facts] ********************************************************************************************************************************
The authenticity of host '52.90.63.1 (52.90.63.1)' can't be established.
ECDSA key fingerprint is SHA256:8E49Po5Sa0JFSCWiLE5ZjOmZlPptbl9y+xU9Z2gSD7c.
The authenticity of host '3.80.10.89 (3.80.10.89)' can't be established.
ECDSA key fingerprint is SHA256:zpwEwKVMDnkjbs2/Tq2vyDC7BEja9CdIN/aMRmJZxJ8.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
ok: [54.92.147.136]
ok: [52.90.63.1]
^C [ERROR]: User interrupted execution
root@ubuntu-focal:/home/vagrant/terraform-instance# ansible-playbook -i host-inventory playbb.yml 

PLAY [webserver] **************************************************************************************************************************************

TASK [Gathering Facts] ********************************************************************************************************************************
The authenticity of host '3.80.10.89 (3.80.10.89)' can't be established.
ECDSA key fingerprint is SHA256:zpwEwKVMDnkjbs2/Tq2vyDC7BEja9CdIN/aMRmJZxJ8.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
ok: [54.92.147.136]
ok: [52.90.63.1]
ok: [3.80.10.89]

TASK [Install packages] *******************************************************************************************************************************
changed: [3.80.10.89]
changed: [52.90.63.1]
changed: [54.92.147.136]

TASK [Install apache2] ********************************************************************************************************************************
changed: [3.80.10.89]
changed: [52.90.63.1]
changed: [54.92.147.136]

TASK [Set timezone] ***********************************************************************************************************************************
changed: [54.92.147.136]
changed: [52.90.63.1]
changed: [3.80.10.89]

TASK [Print host name to server] **********************************************************************************************************************
changed: [54.92.147.136]
changed: [3.80.10.89]
changed: [52.90.63.1]

TASK [Restart apache2] ********************************************************************************************************************************
changed: [54.92.147.136]
changed: [52.90.63.1]
changed: [3.80.10.89]

PLAY RECAP ********************************************************************************************************************************************
3.80.10.89                 : ok=6    changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
52.90.63.1                 : ok=6    changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
54.92.147.136              : ok=6    changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

root@ubuntu-focal:/home/vagrant/terraform-instance# nano terraform-instance
root@ubuntu-focal:/home/vagrant/terraform-instance# ls -al
total 104
drwxrwxr-x  4 vagrant vagrant  4096 Feb  5 21:42 .
drwxr-xr-x 13 vagrant vagrant  4096 Feb  5 18:18 ..
drwxr-xr-x  3 vagrant vagrant  4096 Jan 29 10:53 .terraform
-rw-r--r--  1 vagrant vagrant  2453 Feb  4 06:09 .terraform.lock.hcl
drwxrwxr-x  2 vagrant vagrant  4096 Feb  5 14:08 ansibleforproj
-rw-r--r--  1 root    root       48 Feb  5 21:19 host-inventory
-rw-rw-r--  1 vagrant vagrant  5861 Feb  5 18:03 main.tf
-rw-rw-r--  1 vagrant vagrant   591 Feb  5 21:23 playbb.yml
-rw-rw-r--  1 vagrant vagrant 42104 Feb  5 18:06 terraform.tfstate
-rw-rw-r--  1 vagrant vagrant 17748 Feb  5 18:04 terraform.tfstate.backup
-r--------  1 vagrant vagrant  1679 Feb  5 19:32 terrap.pem
root@ubuntu-focal:/home/vagrant/terraform-instance# nano main.tf
root@ubuntu-focal:/home/vagrant/terraform-instance# ls -al
total 104
drwxrwxr-x  4 vagrant vagrant  4096 Feb  5 21:50 .
drwxr-xr-x 13 vagrant vagrant  4096 Feb  5 18:18 ..
drwxr-xr-x  3 vagrant vagrant  4096 Jan 29 10:53 .terraform
-rw-r--r--  1 vagrant vagrant  2453 Feb  4 06:09 .terraform.lock.hcl
drwxrwxr-x  2 vagrant vagrant  4096 Feb  5 14:08 ansibleforproj
-rw-r--r--  1 root    root       48 Feb  5 21:19 host-inventory
-rw-rw-r--  1 vagrant vagrant  5861 Feb  5 18:03 main.tf
-rw-rw-r--  1 vagrant vagrant   591 Feb  5 21:23 playbb.yml
-rw-rw-r--  1 vagrant vagrant 42104 Feb  5 18:06 terraform.tfstate
-rw-rw-r--  1 vagrant vagrant 17748 Feb  5 18:04 terraform.tfstate.backup
-r--------  1 vagrant vagrant  1679 Feb  5 19:32 terrap.pem
root@ubuntu-focal:/home/vagrant/terraform-instance# nano .gitignore
root@ubuntu-focal:/home/vagrant/terraform-instance# git init
Initialized empty Git repository in /home/vagrant/terraform-instance/.git/
root@ubuntu-focal:/home/vagrant/terraform-instance# git add .
root@ubuntu-focal:/home/vagrant/terraform-instance# git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
	new file:   .gitignore
	new file:   .terraform.lock.hcl
	new file:   .terraform/providers/registry.terraform.io/hashicorp/aws/4.52.0/linux_amd64/terraform-provider-aws_v4.52.0_x5
	new file:   .terraform/providers/registry.terraform.io/hashicorp/local/2.3.0/linux_amd64/terraform-provider-local_v2.3.0_x5
	new file:   host-inventory
	new file:   main.tf
	new file:   playbb.yml
	new file:   terraform.tfstate.backup
	new file:   terrap.pem

root@ubuntu-focal:/home/vagrant/terraform-instance# git commit

*** Please tell me who you are.

Run

  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

to set your account's default identity.
Omit --global to set the identity only in this repository.

fatal: unable to auto-detect email address (got 'root@ubuntu-focal.(none)')
root@ubuntu-focal:/home/vagrant/terraform-instance# git commit -m "first-commit"

*** Please tell me who you are.

Run

  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

to set your account's default identity.
Omit --global to set the identity only in this repository.

fatal: unable to auto-detect email address (got 'root@ubuntu-focal.(none)')
root@ubuntu-focal:/home/vagrant/terraform-instance# git config --global user.email "fgod547@gmail.com"
root@ubuntu-focal:/home/vagrant/terraform-instance# git config user.name "dkckac8989"
root@ubuntu-focal:/home/vagrant/terraform-instance# git commit
Aborting commit due to empty commit message.
root@ubuntu-focal:/home/vagrant/terraform-instance# git commit -m
error: switch `m' requires a value
root@ubuntu-focal:/home/vagrant/terraform-instance# git commit -m "first-commit"
[master (root-commit) 9e4cbd9] first-commit
 9 files changed, 932 insertions(+)
 create mode 100644 .gitignore
 create mode 100644 .terraform.lock.hcl
 create mode 100755 .terraform/providers/registry.terraform.io/hashicorp/aws/4.52.0/linux_amd64/terraform-provider-aws_v4.52.0_x5
 create mode 100755 .terraform/providers/registry.terraform.io/hashicorp/local/2.3.0/linux_amd64/terraform-provider-local_v2.3.0_x5
 create mode 100644 host-inventory
 create mode 100644 main.tf
 create mode 100644 playbb.yml
 create mode 100644 terraform.tfstate.backup
 create mode 100644 terrap.pem
root@ubuntu-focal:/home/vagrant/terraform-instance# git remote add origin https://github.com/dkckac8989/alt-terraform-project.git
root@ubuntu-focal:/home/vagrant/terraform-instance# git push -u origin main
error: src refspec main does not match any
error: failed to push some refs to 'https://github.com/dkckac8989/alt-terraform-project.git'
root@ubuntu-focal:/home/vagrant/terraform-instance# git push -u origin master
Username for 'https://github.com': dkckac8989
Password for 'https://dkckac8989@github.com': 
remote: Invalid username or password.
fatal: Authentication failed for 'https://github.com/dkckac8989/alt-terraform-project.git/'
root@ubuntu-focal:/home/vagrant/terraform-instance# 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
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: command not found
root@ubuntu-focal:/home/vagrant/terraform-instance# git remote add origin https://github.com/dkckac8989/alt-terraform-project.git
fatal: remote origin already exists.
root@ubuntu-focal:/home/vagrant/terraform-instance# git push -u origin master
Username for 'https://github.com': dkckac8989
Password for 'https://dkckac8989@github.com': 
fatal: unable to access 'https://github.com/dkckac8989/alt-terraform-project.git/': The requested URL returned error: 400
root@ubuntu-focal:/home/vagrant/terraform-instance# git remote add origin https://github.com/dkckac8989/alt-terraform-project.git
fatal: remote origin already exists.
root@ubuntu-focal:/home/vagrant/terraform-instance# git push -u origin master
Username for 'https://github.com': dkckac8989             
Password for 'https://dkckac8989@github.com': 
Enumerating objects: 21, done.
Counting objects: 100% (21/21), done.
Delta compression using up to 2 threads
Compressing objects: 100% (13/13), done.
Writing objects: 100% (21/21), 76.34 MiB | 1.46 MiB/s, done.
Total 21 (delta 0), reused 0 (delta 0)
remote: error: Trace: a2bd2b0a9672da57cae7660c19a569e6a3c53017b3c8afa5b596fcfaec57b100
remote: error: See http://git.io/iEPt8g for more information.
remote: error: File .terraform/providers/registry.terraform.io/hashicorp/aws/4.52.0/linux_amd64/terraform-provider-aws_v4.52.0_x5 is 323.14 MB; this exceeds GitHub's file size limit of 100.00 MB
remote: error: GH001: Large files detected. You may want to try Git Large File Storage - https://git-lfs.github.com.
To https://github.com/dkckac8989/alt-terraform-project.git
 ! [remote rejected] master -> master (pre-receive hook declined)
error: failed to push some refs to 'https://github.com/dkckac8989/alt-terraform-project.git'
root@ubuntu-focal:/home/vagrant/terraform-instance# ls -al
total 112
drwxrwxr-x  5 vagrant vagrant  4096 Feb  5 21:56 .
drwxr-xr-x 13 vagrant vagrant  4096 Feb  5 18:18 ..
drwxr-xr-x  8 root    root     4096 Feb  5 22:05 .git
-rw-r--r--  1 root    root      871 Feb  5 21:53 .gitignore
drwxr-xr-x  3 vagrant vagrant  4096 Jan 29 10:53 .terraform
-rw-r--r--  1 vagrant vagrant  2453 Feb  4 06:09 .terraform.lock.hcl
drwxrwxr-x  2 vagrant vagrant  4096 Feb  5 14:08 ansibleforproj
-rw-r--r--  1 root    root       48 Feb  5 21:19 host-inventory
-rw-rw-r--  1 vagrant vagrant  5861 Feb  5 18:03 main.tf
-rw-rw-r--  1 vagrant vagrant   591 Feb  5 21:23 playbb.yml
-rw-rw-r--  1 vagrant vagrant 42104 Feb  5 18:06 terraform.tfstate
-rw-rw-r--  1 vagrant vagrant 17748 Feb  5 18:04 terraform.tfstate.backup
-r--------  1 vagrant vagrant  1679 Feb  5 19:32 terrap.pem
root@ubuntu-focal:/home/vagrant/terraform-instance# exit
exit
vagrant@ubuntu-focal:~/terraform-instance$ sudo su
root@ubuntu-focal:/home/vagrant/terraform-instance# rm .gitignore
root@ubuntu-focal:/home/vagrant/terraform-instance# ls -al
total 108
drwxrwxr-x  5 vagrant vagrant  4096 Feb  5 22:30 .
drwxr-xr-x 13 vagrant vagrant  4096 Feb  5 18:18 ..
drwxr-xr-x  8 root    root     4096 Feb  5 22:05 .git
drwxr-xr-x  3 vagrant vagrant  4096 Jan 29 10:53 .terraform
-rw-r--r--  1 vagrant vagrant  2453 Feb  4 06:09 .terraform.lock.hcl
drwxrwxr-x  2 vagrant vagrant  4096 Feb  5 14:08 ansibleforproj
-rw-r--r--  1 root    root       48 Feb  5 21:19 host-inventory
-rw-rw-r--  1 vagrant vagrant  5861 Feb  5 18:03 main.tf
-rw-rw-r--  1 vagrant vagrant   591 Feb  5 21:23 playbb.yml
-rw-rw-r--  1 vagrant vagrant 42104 Feb  5 18:06 terraform.tfstate
-rw-rw-r--  1 vagrant vagrant 17748 Feb  5 18:04 terraform.tfstate.backup
-r--------  1 vagrant vagrant  1679 Feb  5 19:32 terrap.pem
root@ubuntu-focal:/home/vagrant/terraform-instance# exit
exit
vagrant@ubuntu-focal:~/terraform-instance$ sudo nano .gitignore
vagrant@ubuntu-focal:~/terraform-instance$ ls -al
total 112
drwxrwxr-x  5 vagrant vagrant  4096 Feb  5 22:31 .
drwxr-xr-x 13 vagrant vagrant  4096 Feb  5 18:18 ..
drwxr-xr-x  8 root    root     4096 Feb  5 22:05 .git
-rw-r--r--  1 root    root      871 Feb  5 22:31 .gitignore
drwxr-xr-x  3 vagrant vagrant  4096 Jan 29 10:53 .terraform
-rw-r--r--  1 vagrant vagrant  2453 Feb  4 06:09 .terraform.lock.hcl
drwxrwxr-x  2 vagrant vagrant  4096 Feb  5 14:08 ansibleforproj
-rw-r--r--  1 root    root       48 Feb  5 21:19 host-inventory
-rw-rw-r--  1 vagrant vagrant  5861 Feb  5 18:03 main.tf
-rw-rw-r--  1 vagrant vagrant   591 Feb  5 21:23 playbb.yml
-rw-rw-r--  1 vagrant vagrant 42104 Feb  5 18:06 terraform.tfstate
-rw-rw-r--  1 vagrant vagrant 17748 Feb  5 18:04 terraform.tfstate.backup
-r--------  1 vagrant vagrant  1679 Feb  5 19:32 terrap.pem
vagrant@ubuntu-focal:~/terraform-instance$ sudo chown -R vagrant:vagrant .gitignore
vagrant@ubuntu-focal:~/terraform-instance$ ls -al
total 112
drwxrwxr-x  5 vagrant vagrant  4096 Feb  5 22:31 .
drwxr-xr-x 13 vagrant vagrant  4096 Feb  5 18:18 ..
drwxr-xr-x  8 root    root     4096 Feb  5 22:05 .git
-rw-r--r--  1 vagrant vagrant   871 Feb  5 22:31 .gitignore
drwxr-xr-x  3 vagrant vagrant  4096 Jan 29 10:53 .terraform
-rw-r--r--  1 vagrant vagrant  2453 Feb  4 06:09 .terraform.lock.hcl
drwxrwxr-x  2 vagrant vagrant  4096 Feb  5 14:08 ansibleforproj
-rw-r--r--  1 root    root       48 Feb  5 21:19 host-inventory
-rw-rw-r--  1 vagrant vagrant  5861 Feb  5 18:03 main.tf
-rw-rw-r--  1 vagrant vagrant   591 Feb  5 21:23 playbb.yml
-rw-rw-r--  1 vagrant vagrant 42104 Feb  5 18:06 terraform.tfstate
-rw-rw-r--  1 vagrant vagrant 17748 Feb  5 18:04 terraform.tfstate.backup
-r--------  1 vagrant vagrant  1679 Feb  5 19:32 terrap.pem
vagrant@ubuntu-focal:~/terraform-instance$ sudo chown -R vagrant:vagrant host-inventory 
vagrant@ubuntu-focal:~/terraform-instance$ ls -al
total 112
drwxrwxr-x  5 vagrant vagrant  4096 Feb  5 22:31 .
drwxr-xr-x 13 vagrant vagrant  4096 Feb  5 18:18 ..
drwxr-xr-x  8 root    root     4096 Feb  5 22:05 .git
-rw-r--r--  1 vagrant vagrant   871 Feb  5 22:31 .gitignore
drwxr-xr-x  3 vagrant vagrant  4096 Jan 29 10:53 .terraform
-rw-r--r--  1 vagrant vagrant  2453 Feb  4 06:09 .terraform.lock.hcl
drwxrwxr-x  2 vagrant vagrant  4096 Feb  5 14:08 ansibleforproj
-rw-r--r--  1 vagrant vagrant    48 Feb  5 21:19 host-inventory
-rw-rw-r--  1 vagrant vagrant  5861 Feb  5 18:03 main.tf
-rw-rw-r--  1 vagrant vagrant   591 Feb  5 21:23 playbb.yml
-rw-rw-r--  1 vagrant vagrant 42104 Feb  5 18:06 terraform.tfstate
-rw-rw-r--  1 vagrant vagrant 17748 Feb  5 18:04 terraform.tfstate.backup
-r--------  1 vagrant vagrant  1679 Feb  5 19:32 terrap.pem
vagrant@ubuntu-focal:~/terraform-instance$ git push -u origin master
fatal: detected dubious ownership in repository at '/home/vagrant/terraform-instance'
To add an exception for this directory, call:

	git config --global --add safe.directory /home/vagrant/terraform-instance
vagrant@ubuntu-focal:~/terraform-instance$ sudo su
root@ubuntu-focal:/home/vagrant/terraform-instance# git push -u origin master
Username for 'https://github.com': dkckac8989
Password for 'https://dkckac8989@github.com': 
Enumerating objects: 21, done.
Counting objects: 100% (21/21), done.
Delta compression using up to 2 threads
Compressing objects: 100% (13/13), done.
Writing objects: 100% (21/21), 76.34 MiB | 1.35 MiB/s, done.
Total 21 (delta 0), reused 0 (delta 0)
remote: error: Trace: 3915ba510e71fc94b8f0372848e3f4a9b036ed60b1dcddfc55ee0bb2407de2cb
remote: error: See http://git.io/iEPt8g for more information.
remote: error: File .terraform/providers/registry.terraform.io/hashicorp/aws/4.52.0/linux_amd64/terraform-provider-aws_v4.52.0_x5 is 323.14 MB; this exceeds GitHub's file size limit of 100.00 MB
remote: error: GH001: Large files detected. You may want to try Git Large File Storage - https://git-lfs.github.com.
To https://github.com/dkckac8989/alt-terraform-project.git
 ! [remote rejected] master -> master (pre-receive hook declined)
error: failed to push some refs to 'https://github.com/dkckac8989/alt-terraform-project.git'
root@ubuntu-focal:/home/vagrant/terraform-instance# chmod 777 .gitignore
root@ubuntu-focal:/home/vagrant/terraform-instance# git push -u origin master
Username for 'https://github.com': dkckac8989
Password for 'https://dkckac8989@github.com': 
fatal: unable to access 'https://github.com/dkckac8989/alt-terraform-project.git/': GnuTLS recv error (-54): Error in the pull function.
root@ubuntu-focal:/home/vagrant/terraform-instance# git push -u origin master
Username for 'https://github.com': dkckac8989
Password for 'https://dkckac8989@github.com': 
root@ubuntu-focal:/home/vagrant/terraform-instance# sudo nano main.tf

  GNU nano 4.8                                                            main.tf                                                                      

  records = aws_route53_zone.capitalapps.name_servers
}
#route 53 A record
resource "aws_route53_record" "record"{
  zone_id = aws_route53_zone.capitalapps.zone_id
  name = "terraform-test.capitalapps.me"
  type = "A"

  alias {
    name = aws_lb.myloadbalancer.dns_name
    zone_id = aws_lb.myloadbalancer.zone_id
    evaluate_target_health = true
  }
}
# Create a file to store the IP addresses of the instances
resource "local_file" "Ip_address" {
  filename = "host-inventory"
  content  = <<EOT
${aws_instance.myinstance-1.public_ip}
${aws_instance.myinstance-2.public_ip}
${aws_instance.myinstance-3.public_ip}
  EOT
}
#output

output "lb_target_group_arn"{
  value = aws_lb_target_group.mytargetgroup.arn
}

output "lb_load_balancer_dns_name"{
  value = aws_lb.myloadbalancer.dns_name
}

output "elastic_load_balancer_zone_id"{
  value = aws_lb.myloadbalancer.zone_id
}

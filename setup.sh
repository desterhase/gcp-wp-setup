##############################################################################################
# setup.sh: set up a new wordpress site and manage it's deployment on GCP from command line  
# author: don brower 2022
##############################################################################################
#
# NOTE(don): If you want to make this or any other scripts executable: `chmod +x script.sh' ==
# -rwxr-xr-x  1 donaldbrower  staff  699 Aug  7 12:53 setup.sh

# NOTE(don): Software for starting version
#
# Debian(10.12)
# Apache2(2.4.38)
# Google-Fluentd(1.9.7)
# MySQL-Client(5.7.38)
# MySQL-Server(5.7.38)
# PHP(7.4.29)
# Stackdriver-Agent(6.1.4)
# WP-CLI(2.6.0)
# WordPress(5.9.3)
# phpMyAdmin(5.0.2)

# NOTE(don): Not sure of how to use click to deploy from the command line.
# This script will deal with the site once it's been set up

# NOTE(don): the command to SSH into the machine.
gcloud compute ssh --zone "us-west1-a" "bacon-and-butter-vm"  --tunnel-through-iap --project "bacon-and-butter-358720" 
#
# NOTE(don): the command to gzip and transfer file to a host machine
# gcloud compute ssh --zone "us-west1-a" "bacon-and-butter-vm"  --tunnel-through-iap --project "bacon-and-butter-358720" \
#        --command="sudo tar -zcvf ~/html.tar.gz /var/www/html" 
#
# NOTE(don): The command to copy over the archive
# gcloud compute copy-files bacon-and-butter-vm:~/html.tar.gz ~/git/websites/baconandbuttersac.com --zone="us-west1-a" --project="bacon-and-butter-358720"
# tar -zxf ~/git/websites/baconandbutter.sac/html.tar.gz --directory ~/git/websites/baconandbuttersac.com/html
	
	
# NOTE(don): Command output if it doesn't if it can't find running instance 
#
# ./setup.sh
#  Updating project ssh metadata...⠧Updated [https://www.googleapis.com/compute/v1/projects/bacon-and-butter].
#  Updating project ssh metadata...done.
#  Waiting for SSH key to propagate.
#  ERROR: (gcloud.compute.start-iap-tunnel) Error while connecting [4047: 'Failed to lookup instance'].
#  kex_exchange_identification: Connection closed by remote host
#  ERROR: (gcloud.compute.start-iap-tunnel) Error while connecting [4047: 'Failed to lookup instance'].
#  kex_exchange_identification: Connection closed by remote host
#  ERROR: (gcloud.compute.start-iap-tunnel) Error while connecting [4047: 'Failed to lookup instance'].
#  kex_exchange_identification: Connection closed by remote host
#  ERROR: (gcloud.compute.start-iap-tunnel) Error while connecting [4047: 'Failed to lookup instance'].
#  kex_exchange_identification: Connection closed by remote host
#  ERROR: (gcloud.compute.start-iap-tunnel) Error while connecting [4047: 'Failed to lookup instance'].
#  kex_exchange_identification: Connection closed by remote host
 
# WARNING(don): i did some gzip command that messed up the directory i was trying to compress, wrote over the files I was trying to create a secondary gzip archive:
#
# Be warey of these commands:
#
# 28  gzip
# 29  gzip -h
# 30  gzip -rs
# 31  gzip html/ -rs
# 32  gzip html/ -rS
# 33  gzip -rS html/
# 34  gzip -rfS html/
# 35  gzip -rfS html/ > site.gzip
# 36  sudo gzip -rfS html/ > site.gzip
# 37  sudo gzip -rfS html/ > ~/site.gzip
# 38  sudo gzip -r html/ > ~/site.gzip# gzip -h

# TODO(don): decide on one branch that is going to be pinned for production.  release, or something like that.

# TODO(don): maintain two copies of the wordpress mysql database, one for production, one for staging, and a command to spin one up and tear one down based off any random branch if I am testing something?

# NOTE(don): When committing to the staging branch, then the staging deployment is updated.  there should be an option though to have changes directly to the working tree be updated in the deployment as they are being made, i.e CSS changes.  i want the feedback loop to be as short as possible.

# NOTE(don): Are there any changes outside of the themes and plugins files for thegreenroomsac.com?  If there aren't, can I maintain a repo for gm/plugins, gm/themes, bb/plugins, bb/themes?



# wp-files on production server      wp-plugin & theme files in repo       
# wp-files on staging server                        










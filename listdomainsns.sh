#!/bin/bash


echo -e "Enter the cpanel user to list domains and respective nameservers:"
read user;
 
 
for i in $(cpapi2 --user=$user DomainLookup getbasedomains | grep domain | cut -d: -f2 | grep -v getbasedomains); do echo '==========================' && echo 'Nameservers for:' $i && dig ns $i @8.8.4.4 +short;done;



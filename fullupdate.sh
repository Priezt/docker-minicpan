#!/bin/bash

while true ; do
	/usr/bin/rsync -av --delete cpan-rsync.perl.org::CPAN /fullcpan
	sleep 3600
done

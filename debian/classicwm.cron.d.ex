#
# Regular cron jobs for the classicwm package
#
0 4	* * *	root	[ -x /usr/bin/classicwm_maintenance ] && /usr/bin/classicwm_maintenance

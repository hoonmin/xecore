#!/bin/bash
set -e

function log {
	echo >&2 "[$(date)] entrypoint.sh $*"
}

function info {
	log "INFO $*"
}

function warn {
	log "WARN $*"
}

function install_package {
	info "XE not found in $(pwd). Unpacking the package."

	if [ "$(ls -A)" ]; then
		warn "$(pwd) is not empty. Skipping the installation."
		return
	fi

	# Unpack the xe.tar.gz
	tar xvf /var/www/xe.tar.gz .
	info "Completed."

	# Create the files directory
	info "Creating the files directory"
	chown -R www-data:www-data /var/www/html
	mkdir /var/www/html/files
	chmod -R 707 /var/www/html/files
	info "Completed."
}

if [[ "$1" == apache2* ]]; then
	# Install the package
	if ! [ -e /var/www/html/files/config ]; then
		install_package
	fi
fi

exec "$@"

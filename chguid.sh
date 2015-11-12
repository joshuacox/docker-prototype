#!/bin/bash

  # Check for a passed in DOCKER_UID environment variable. If it's there
  # then ensure that the DESTINATION_ID user is set to this UID. That way we can
  # easily edit files from the host.
  if [ -n "$DOCKER_UID" ]; then
    printf "Updating UID...\n"
    # First see if it's already set.
    current_uid=$(getent passwd DESTINATION_ID | cut -d: -f3)
    if [ "$current_uid" -eq "$DOCKER_UID" ]; then
      printf "UIDs already match.\n"
    else
      printf "Updating UID from %s to %s.\n" "$current_uid" "$DOCKER_UID"
      usermod -u "$DOCKER_UID" DESTINATION_ID
    fi
  fi


whoami
chown -R DESTINATION_ID. /home/DESTINATION_ID
chown -R DESTINATION_ID. /srv/www

sudo -u DESTINATION_ID /bin/bash -c "/srv/www/run.sh"

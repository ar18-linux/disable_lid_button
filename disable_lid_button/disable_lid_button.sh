#!/bin/bash

button="$(cat /proc/acpi/wakeup | grep -i lid | tr -s ' ' | cut -d ' ' -f 3 | sed 's/platform://g')"

echo "${button}" > /sys/bus/acpi/drivers/button/unbind
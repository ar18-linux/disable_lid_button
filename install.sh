#!/bin/bash

if [[ "$(whoami)" != "root" ]]; then
  read -p "[ERROR] must be root!"
  exit 1
fi

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

. "${script_dir}/vars"

if [ ! -d "${install_dir}" ]; then
  mkdir -p "${install_dir}"
fi

rm -rf "${install_dir}/${module_name}"
cp -rf "${script_dir}/${module_name}" "${install_dir}/${module_name}"
chmod +x "${install_dir}/${module_name}/"* -R

cp "${script_dir}/${module_name}.service" "/etc/systemd/system/${module_name}.service"
chmod 777 "/etc/systemd/system/${module_name}.service"
systemctl enable "${module_name}.service"
systemctl start "${module_name}.service"

#!/bin/bash
# https://github.com/Hyy2001X/AutoBuild-Actions
# AutoBuild Module by Hyy2001

rm -f /tmp/cloud_version
if [ ! -f /bin/AutoUpdate.sh ];then
	echo "未检测到 /bin/AutoUpdate.sh" > /tmp/cloud_version
	exit
fi
Firmware_Type="$(awk 'NR==4' /etc/openwrt_info)"
Firmware_COMP1="$(awk 'NR==5' /etc/openwrt_info)"
Firmware_COMP2="$(awk 'NR==6' /etc/openwrt_info)"
[[ -z "${CURRENT_DEVICE}" ]] && CURRENT_DEVICE="$(jsonfilter -e '@.model.id' < "/etc/board.json" | tr ',' '_')"
Github="$(awk 'NR==2' /etc/openwrt_info)"
[[ -z "${Github}" ]] && exit
Author="${Github##*com/}"
Github_Tags="https://api.github.com/repos/${Author}/releases/latest"
wget -q ${Github_Tags} -O - > /tmp/Github_Tags
case ${CURRENT_DEVICE} in
x86_64)
	if [ -d /sys/firmware/efi ];then
		Firmware_SFX="-UEFI.${Firmware_Type}"
		BOOT_Type="-UEFI"
	else
		Firmware_SFX="-Legacy.${Firmware_Type}"
		BOOT_Type="-Legacy"
	fi
;;
*)
	Firmware_SFX=".${Firmware_Type}"
	BOOT_Type=""
;;
esac
Cloud_Ver="$(cat /tmp/Github_Tags | egrep -o "${Firmware_COMP1}-${Firmware_COMP2}-${CURRENT_DEVICE}-[0-9]+.*?[0-9]+${Firmware_SFX}" | awk 'END {print}' | egrep -o '[a-zA-Z0-9_-]+.*?[0-9]+')"
upda_day="${Cloud_Ver##*${CURRENT_DEVICE}-}"
upda_day1="${upda_day%-*}"
upda_day2="${upda_day#*-}"
GET_Ver="${upda_day1}${upda_day2}"
GET_Version="${upda_day1}-${upda_day2}"
CURRENT_day1="$(awk 'NR==7' /etc/openwrt_info)"
CURRENT_day2="$(awk 'NR==8' /etc/openwrt_info)"
CURRENT_Version="${CURRENT_day1}${CURRENT_day2}"
if [[ ! -z "${Cloud_Ver}" ]];then
    if [[ "${CURRENT_Version}" -gt "${GET_Ver}" ]];then
        Checked_Type="当前版本大于Github版本"
		echo "${GET_Version}${BOOT_Type} [${Checked_Type}]" > /tmp/cloud_version
    elif [[ "${CURRENT_Version}" -eq "${GET_Ver}" ]];then
        Checked_Type="已是最新"
		echo "${GET_Version}${BOOT_Type} [${Checked_Type}]" > /tmp/cloud_version
	elif [[ "${CURRENT_Version}" -lt "${GET_Ver}" ]];then
	    Checked_Type="可更新"
		echo "${GET_Version}${BOOT_Type} [${Checked_Type}]" > /tmp/cloud_version
	fi
else
    echo "未知" > /tmp/cloud_version
fi
exit

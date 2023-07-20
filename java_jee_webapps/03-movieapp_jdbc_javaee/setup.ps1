#!/bin/bash
$CONF_DIR = "conf"
$PROPERTIES_BASEFILE = "database.properties"
$RESOURCES_DIR ="src/main/resources"

function print_usage () {
	echo "Usage: setup.ps1 conf_suffix_name"
	echo ""
	echo "Example: setup project with ${CONF_DIR}/${PROPERTIES_BASEFILE}-maria"
	echo "setup.ps1 maria"
}

if ($args.count -ne 1) {
	echo "Missing parameter 1: conf file"
	print_usage
	exit -1
}

$CONF_FILE =$args[0]
$CONF_PATH = "${CONF_DIR}/${PROPERTIES_BASEFILE}-${CONF_FILE}"

if (!(Test-Path  "${CONF_PATH}")) {
	echo "Configuration file does not exist: $CONF_PATH"
	print_usage
	exit -1
}

mkdir "${RESOURCES_DIR}" -ErrorAction SilentlyContinue

$DEST_PATH = "${RESOURCES_DIR}/${PROPERTIES_BASEFILE}"
cp "${CONF_PATH}" "${DEST_PATH}"
echo "Project fixed: ${CONF_PATH} -> ${DEST_PATH}"
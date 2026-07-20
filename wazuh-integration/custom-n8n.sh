#!/bin/sh
#
# Custom Wazuh Integration Script: custom-n8n
# Location on Wazuh Manager: /var/ossec/integrations/custom-n8n
#
# Forwards Wazuh alert JSON to the n8n webhook endpoint for enrichment
# (IOC extraction + VirusTotal lookup). Triggered automatically by Wazuh
# for alerts at or above the configured rule level (see ossec.conf integration block).

ALERT_FILE=$1
WEBHOOK_URL="http://192.168.56.10:5678/webhook/wazuh"

curl -s -X POST "$WEBHOOK_URL" \
  -H "Content-Type: application/json" \
  -d @"$ALERT_FILE"

#! bin/bash
HTTPDUSER=`ps aux | grep -E "[a]pache|[h]ttpd|[_]www|[w]ww-data|[n]ginx" | grep -v root | head -1 | cut -d\  -f1`
chown $HTTPDUSER:$HTTPDUSER {{project_root}}/tmp
chown $HTTPDUSER:$HTTPDUSER {{project_root}}/logs

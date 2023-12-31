# raspiBackup REST API Server proof of concept

Allows to start raspiBackup from a remote system via curl or any web UI.
1. Clone this repository to your Raspberry which has raspiBackup installed
2. Optionally create a file /usr/local/etc/raspiBackup.auth and define access credentials for the API. For every user create a line userid:password
3. Set file attributes for /usr/local/etc/raspiBackup.auth to 600
4. Start the RESTAPI with ```./raspiBackupRESTAPIListener```. Option -a can be used to define another listening port than :8080.
5. Use ```curl -u userid:password -H "Content-Type: application/json" -X POST -d '{"target":"/backup","type":"rsync", "keep": 3}' http://<raspiHost>:8080/v1/raspiBackup``` to start a rsync backup run.
6. Use ```curl -u userid:password -H "Content-Type: application/json" -X POST -d '{"target":"/backup","type":"tar", "keep": 3}' http://<raspiHost>:8080/v1/raspiBackup``` to start a tar backup run.

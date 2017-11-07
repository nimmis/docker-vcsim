# vCenter and ESi API based simulator

This package implements a vSphere Web Services (SOAP) SDK endpoint intended for testing consumers of the API.
While the package is written in the Go language, it can be used by any language that can talk to the vSphere API.

## Starting the simulator

The simulator can simulate either a vCenter server or an ESXi server, starting it with default values
assumes vCenter server.


### Run simulator as a vCenter server

Start it with default settings as a vCenter server 

	docker run -d -p 443:443 nimmis/vcsim

or

	docker run -d -p 443:443 nimmis/vcsim -vcenter

### Run simulator as a ESXi server

Start it with default settings as a ESXi server

	docker run -d -p 443:443 nimmis/vcsim -esxi



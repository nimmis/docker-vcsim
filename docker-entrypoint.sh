#!/bin/bash


function show_help {

cat <<EOF
Usage:	docker nimmis/vcsim [Options]

A vCenter/ESXi API simulator

Options:
	-E, --esxi           		Simulate ESXi host
	-V, --vcenter        		Simulate vCenter host (default)
	-a, -apps (num)      		Number of virtual apps per compute resource
	-c, --cluster (num)  		Number of clusters (default 1) 
	--dc, --data-centers (num) 	Number of datacenters (default 1)
	--ds, --data-stores (num)  	Number of local datastores (default 1)
	-f, --folders (num)        	Number of folders
 	--hosts (num)		   	Number of hosts per cluster (default 3) 
	-h, --help		   	This help
	--pg, --port-groups (num)  	Number of port groups (default 1)
	--pod, --storage-pods (num) 	Number of storage pods per datacenter
	--pool, --resource-pools (num)  Number of resource pools per compute resource
	--sh, --standalone-host (num)   Number of standalone hosts (default 1)
	--trace				Trace SOAP
	--vm, --virtual-machines (num)	Number of virtual machines per resource pool (default 2)

EOF

}


#
# default values
#

VC_httptest="0.0.0.0:443"

VC_OPT=""

while [[ $# -gt 0 ]]; do

	key="$1"

	case $key in
		-E|--esxi)
			VC_type="-esx"
			shift
			;;
		-V|--vcenter)
			VC_type=""
			shift
			;;
		-a|--apps)
			VC_OPT="$VC_OPT -app $2"
			shift
			shift
			;;
		-c|--clusters)
			VC_OPT="$VC_OPT -cluster $2"
			shift
			shift
			;;
		--dc|--data-centers)
			VC_OPT="$VC_OPT -dc $2"
			shift
			shift
			;;
		--ds|--data-stores)
			VC_OPT="$VC_OPT -ds $2"
                        shift
                        shift
                        ;;
		-f|--folders)
			VC_OPT="$VC_OPT -folder $2"
                        shift
                        shift
                        ;;
		--hosts)
			VC_OPT="$VC_OPT -host $2"
                        shift
                        shift
                        ;;
		-h|--help)
			show_help
			exit 1
			;;
		--pg|--port-groups)
			VC_OPT="$VC_OPT -pg $2"
                        shift
                        shift
                        ;;
		--pod|--storage-pods)
			VC_OPT="$VC_OPT -pod $2"
                        shift
                        shift
                        ;;
		--pool|--resource-pools)
			VC_OPT="$VC_OPT -pool $2"
                        shift
                        shift
                        ;;
		--sh|--standalone-host)
			VC_OPT="$VC_OPT -standalone-host $2"
                        shift
                        shift
                        ;;
		--trace)
			VC_OPT="$VC_OPT -trace"
                        shift
                        ;;
		--vm|--virtual-machines)
			VC_OPT="$VC_OPT -vm $2"
                        shift
                        shift
                        ;;
		*)
			echo "Unknown option $key"
			echo
			show_help
			exit 1
			;;
	esac
done

VC_OPT="$VC_OPT -l $VC_httptest"

#
# build command 
echo "vcsim  $VC_OPT"

vcsim $VC_OPT


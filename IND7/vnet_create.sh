# Creating Checkpoint1 Resources with bash

# echo "Load variables from config.sh"
source ./config.sh

######################################
#VNET Creation
echo "----------------------"
echo "Running Next ---------"
echo "az deployment group create --resource-group $RG_Name --template-file ./Router/template.json"
az deployment group create --resource-group $RG_Name --template-file ./Router/template.json 
echo "Completed ------------"

echo "----------------------"
echo "Running Next ---------"
echo "az deployment group create --resource-group $RG_Name --template-file ./Server/template.json"
az deployment group create --resource-group $RG_Name --template-file ./Server/template.json
echo "Completed ------------"

######################################
#VNET peering uses vnet id
#check vnet id
echo "----------------------"
echo "Runnign Next ... $Student_vnet.id"
stuid=$(az network vnet show --resource-group $RG_Name --name  $Student_vnet --query id --out tsv) 
echo "$stuid"

echo "----------------------"
echo "Runnign Next ... $Server_vnet.id"
srvid=$(az network vnet show --resource-group $RG_Name --name $Server_vnet --query id --out tsv) 
echo "$srvid"

echo "----------------------
echo "Runnign Next ... $Router_vnet.id
rtrid=$(az network vnet show --resource-group $RG_Name --name $Router_vnet --query id --out tsv) 
echo "$rtrid"

if [ -z "$rtrid" -o -z "$srvid" -o -z $stuid ] ; then
        echo "rtrid or srvid or stuid is null "
        echo "program will abort with error 2 in here"
        exit 2
fi

######################################
#VNET Peering Create
echo "----------------------"
echo "Running Next ---------"
echo "Creating Network Peering"
az network vnet peering create --resource-group $RG_Name --name RoutertoStudent --vnet-name $Router_vnet --remote-vnet $stuid --allow-vnet-access --allow-forwarded-traffic 
az network vnet peering create --resource-group $RG_Name --name StudenttoRouter --vnet-name $Student_vnet --remote-vnet $rtrid --allow-vnet-access --allow-forwarded-traffic 
az network vnet peering create --resource-group $RG_Name --name RoutertoServer --vnet-name $Router_vnet --remote-vnet $srvid --allow-vnet-access --allow-forwarded-traffic 
az network vnet peering create --resource-group $RG_Name --name ServertoRouter --vnet-name $Server_vnet --remote-vnet $rtrid --allow-vnet-access --allow-forwarded-traffic 
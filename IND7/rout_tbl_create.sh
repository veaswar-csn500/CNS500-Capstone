# Creating Checkpoint1 Resources with bash

# echo "Load variables from config.sh"
source ./config.sh

######################################
#Route Table creation and subnet association 
echo "----------------------"
echo "Running Next ---------"
echo "az deployment group create --resource-group $RG_Name --template-file ./RouteTable/template.json"
az deployment group create --resource-group $RG_Name --template-file ./RouteTable/template.json 
echo "Completed ------------"

######################################
#Route Table Route Create
echo "----------------------"
echo "Running Next ---------"
echo "Creating Routes"
az network route-table route create -g $RG_Name --route-table-name $RT_Name -n "Route-Server" \
    --next-hop-type VirtualAppliance --address-prefix $Server_SN1 --next-hop-ip-address $Virtual_Appliance

az network route-table route create -g $RG_Name --route-table-name $RT_Name -n "Student-Route" \
    --next-hop-type VirtualAppliance --address-prefix $Virtual_Desktop --next-hop-ip-address $Virtual_Appliance

######################################
#Route Tables Routes Associate
echo "----------------------"
echo "Running Next ---------"
echo "Creating Route Associations"
az network vnet subnet update -n $SubNet --vnet-name $Server_vnet -g $RG_Name --route-table $RT_Name
az network vnet subnet update -n $SubNet --vnet-name $Student_vnet -g $RG_Name --route-table $RT_Name
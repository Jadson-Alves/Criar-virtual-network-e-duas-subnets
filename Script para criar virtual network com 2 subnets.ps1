## Criar virtual network e duas subnets ##

# Variáveis
$Resourcegroup = "RG-FW"
$Location = "EastUS"
$Vnet = "Vnet-Servidores"
$Sub1 = "subnet-Servidores"
$Sub2 = "AzureFirewallSubnet"

# Criar o Resource Group
New-AzResourceGroup -name $Resourcegroup -Location $Location 

# Criar virtual network 
$virtualNetwork = New-AzVirtualNetwork -ResourceGroupName $Resourcegroup -Location $Location -Name $Vnet -AddressPrefix 10.0.0.0/16

# Adicionar uma subnet
$subnetConfig = Add-AzVirtualNetworkSubnetConfig -Name $Sub1 -AddressPrefix 10.0.1.0/24 -VirtualNetwork $virtualNetwork

#Adicionar uma segunda subnet
$subnetConfig2 = Add-AzVirtualNetworkSubnetConfig -Name $Sub2 -AddressPrefix 10.0.100.0/26 -VirtualNetwork $virtualNetwork

# Associar a subnet à virtual network
$virtualNetwork | Set-AzVirtualNetwork
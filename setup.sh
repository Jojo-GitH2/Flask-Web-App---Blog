#!/bin/bash
# Check if Resource Group exists
RG_EXISTS=$(az group exists --name ${{ env.ResourceGroupName }})

if [ "$RG_EXISTS" == "false" ]
then
    az group create --name ${{ env.ResourceGroupName }} --location ${{ env.ResourceGroupLocation }}
fi

# Check if ACR exists
ACR_EXISTS=$(az acr check-name --name $AcrName --query nameAvailable --output tsv)

if [ "$ACR_EXISTS" == "true" ]
then
    az acr create -g ${{ env.ResourceGroupName }} -n $AcrName --sku basic --admin-enabled true
fi

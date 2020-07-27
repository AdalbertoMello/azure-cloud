@echo off
setlocal enabledelayedexpansion

call az group create --name myResourceGroup --location westeurope

for /l %%a in (0,1,4) do (
set regiao=!location[%%a]!

set hour=!time:~0,2!
if "!hour:~0,1!" == " " set hour=0!hour:~1,1!

set nome=!date:~0,2!!date:~3,2!!date:~6,4!!hour!!time:~3,2!!time:~6,2!

set e=az batch account create --resource-group myResourceGroup --name !nome! --location !regiao!
echo !e!
call  az batch account create --resource-group myResourceGroup --name !nome! --location !regiao!

set e=az batch account login --resource-group myResourceGroup --name !nome! --shared-key-auth
echo !e!
call  az batch account login --resource-group myResourceGroup --name !nome! --shared-key-auth

set e=az batch pool create --json-file c:\Pool.json
echo !e!
call  az batch pool create --json-file c:\Pool.json

)


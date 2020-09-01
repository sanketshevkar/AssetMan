#!/bin/bash
#
# SPDX-License-Identifier: Apache-2.0

function _exit(){
    printf "Exiting:%s\n" "$1"
    exit -1
}

# Exit on first error, print all commands.
set -ev
set -o pipefail

# Where am I?
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export FABRIC_CFG_PATH="${DIR}/../config"

cd "${DIR}/../asset-network/"

docker kill cliDigiBank cliMagnetoCorp logspout || true
./network.sh down
./network.sh up createChannel -ca -s couchdb

# Copy the connection profiles so they are in the correct organizations.
cp "${DIR}/../asset-network/organizations/peerOrganizations/org1.example.com/connection-org1.yaml" "${DIR}/organization/bank/gateway/"
cp "${DIR}/../asset-network/organizations/peerOrganizations/org2.example.com/connection-org2.yaml" "${DIR}/organization/arc/gateway/"
cp "${DIR}/../asset-network/organizations/peerOrganizations/org3.example.com/connection-org3.yaml" "${DIR}/organization/investor/gateway/"
cp "${DIR}/../asset-network/organizations/peerOrganizations/org4.example.com/connection-org4.yaml" "${DIR}/organization/hedge-fund/gateway/"
cp "${DIR}/../asset-network/organizations/peerOrganizations/org5.example.com/connection-org5.yaml" "${DIR}/organization/sovereign-fund/gateway/"
cp "${DIR}/../asset-network/organizations/peerOrganizations/org6.example.com/connection-org6.yaml" "${DIR}/organization/corporate/gateway/"
cp "${DIR}/../asset-network/organizations/peerOrganizations/org7.example.com/connection-org7.yaml" "${DIR}/organization/valuation-company/gateway/"
cp "${DIR}/../asset-network/organizations/peerOrganizations/org8.example.com/connection-org8.yaml" "${DIR}/organization/resolution-professional/gateway/"


cp ${DIR}/../asset-network/organizations/peerOrganizations/org1.example.com/users/User1@org1.example.com/msp/signcerts/* ${DIR}/../asset-network/organizations/peerOrganizations/org1.example.com/users/User1@org1.example.com/msp/signcerts/User1@org1.example.com-cert.pem
cp ${DIR}/../asset-network/organizations/peerOrganizations/org1.example.com/users/User1@org1.example.com/msp/keystore/* ${DIR}/../asset-network/organizations/peerOrganizations/org1.example.com/users/User1@org1.example.com/msp/keystore/priv_sk

cp ${DIR}/../asset-network/organizations/peerOrganizations/org2.example.com/users/User1@org2.example.com/msp/signcerts/* ${DIR}/../asset-network/organizations/peerOrganizations/org2.example.com/users/User1@org2.example.com/msp/signcerts/User1@org2.example.com-cert.pem
cp ${DIR}/../asset-network/organizations/peerOrganizations/org2.example.com/users/User1@org2.example.com/msp/keystore/* ${DIR}/../asset-network/organizations/peerOrganizations/org2.example.com/users/User1@org2.example.com/msp/keystore/priv_sk

cp ${DIR}/../asset-network/organizations/peerOrganizations/org3.example.com/users/User1@org3.example.com/msp/signcerts/* ${DIR}/../asset-network/organizations/peerOrganizations/org3.example.com/users/User1@org3.example.com/msp/signcerts/User1@org3.example.com-cert.pem
cp ${DIR}/../asset-network/organizations/peerOrganizations/org3.example.com/users/User1@org3.example.com/msp/keystore/* ${DIR}/../asset-network/organizations/peerOrganizations/org3.example.com/users/User1@org3.example.com/msp/keystore/priv_sk

cp ${DIR}/../asset-network/organizations/peerOrganizations/org4.example.com/users/User1@org4.example.com/msp/signcerts/* ${DIR}/../asset-network/organizations/peerOrganizations/org4.example.com/users/User1@org4.example.com/msp/signcerts/User1@org4.example.com-cert.pem
cp ${DIR}/../asset-network/organizations/peerOrganizations/org4.example.com/users/User1@org4.example.com/msp/keystore/* ${DIR}/../asset-network/organizations/peerOrganizations/org4.example.com/users/User1@org4.example.com/msp/keystore/priv_sk

cp ${DIR}/../asset-network/organizations/peerOrganizations/org5.example.com/users/User1@org5.example.com/msp/signcerts/* ${DIR}/../asset-network/organizations/peerOrganizations/org5.example.com/users/User1@org5.example.com/msp/signcerts/User1@org5.example.com-cert.pem
cp ${DIR}/../asset-network/organizations/peerOrganizations/org5.example.com/users/User1@org5.example.com/msp/keystore/* ${DIR}/../asset-network/organizations/peerOrganizations/org5.example.com/users/User1@org5.example.com/msp/keystore/priv_sk

cp ${DIR}/../asset-network/organizations/peerOrganizations/org6.example.com/users/User1@org6.example.com/msp/signcerts/* ${DIR}/../asset-network/organizations/peerOrganizations/org6.example.com/users/User1@org6.example.com/msp/signcerts/User1@org6.example.com-cert.pem
cp ${DIR}/../asset-network/organizations/peerOrganizations/org6.example.com/users/User1@org6.example.com/msp/keystore/* ${DIR}/../asset-network/organizations/peerOrganizations/org6.example.com/users/User1@org6.example.com/msp/keystore/priv_sk

cp ${DIR}/../asset-network/organizations/peerOrganizations/org7.example.com/users/User1@org7.example.com/msp/signcerts/* ${DIR}/../asset-network/organizations/peerOrganizations/org7.example.com/users/User1@org7.example.com/msp/signcerts/User1@org7.example.com-cert.pem
cp ${DIR}/../asset-network/organizations/peerOrganizations/org7.example.com/users/User1@org7.example.com/msp/keystore/* ${DIR}/../asset-network/organizations/peerOrganizations/org7.example.com/users/User1@org7.example.com/msp/keystore/priv_sk

cp ${DIR}/../asset-network/organizations/peerOrganizations/org8.example.com/users/User1@org8.example.com/msp/signcerts/* ${DIR}/../asset-network/organizations/peerOrganizations/org8.example.com/users/User1@org8.example.com/msp/signcerts/User1@org8.example.com-cert.pem
cp ${DIR}/../asset-network/organizations/peerOrganizations/org8.example.com/users/User1@org8.example.com/msp/keystore/* ${DIR}/../asset-network/organizations/peerOrganizations/org8.example.com/users/User1@org8.example.com/msp/keystore/priv_sk

echo Suggest that you monitor the docker containers by running
echo "./organization/magnetocorp/configuration/cli/monitordocker.sh net_test"

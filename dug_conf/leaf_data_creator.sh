
#!/bin/bash

data_file=$1
vlan_data=$2
var_file=$3
default_vid=1


echo "global:" > $var_file
echo "  l3_vlan_id: $default_vid " >> $var_file
echo "leaf:" >> $var_file
cat $data_file | awk '{print $1}' | sort | uniq > leaf_names

for leaf in  `cat ./leaf_names`
do
 echo " $leaf:" >> $var_file
 router_id=`grep $leaf $data_file | awk '{print $2}'|sort | uniq `
 as=`grep $leaf $data_file | awk '{print $3}'|sort | uniq`
 l3_vlan_ip=`grep $leaf $vlan_data | awk '{print $3}'`
 network_to_advertise=`grep $leaf $vlan_data | awk '{print $2}'`
 echo "  loopback: $router_id" >> $var_file
 echo "  router_id: $router_id" >> $var_file
 echo "  asn: $as" >> $var_file
 echo "  l3_vlan_ip: $l3_vlan_ip/23" >> $var_file
 echo "  network_to_advertise: $network_to_advertise/23" >> $var_file
 echo "  bgp_ports: " >> $var_file
 while read src rid sasn network snp snip dnip dasn
 do
  echo "   - $snp: "  >> $var_file
  echo "      ip: $snip"    >> $var_file
  echo "      nip: $dnip"   >> $var_file
  echo "      neighbor_as: $dasn"  >> $var_file
  echo ""  >> $var_file
done <  <(cat $data_file | grep $leaf)
done


#!/bin/bash

data_file=$1
var_file=$2


echo "super_spine:" > $var_file

cat $data_file | awk '{print $1}' | sort | uniq > super_spine_names


for super_spine in  `cat ./super_spine_names`
do
 echo " $super_spine:" >> $var_file
 router_id=`grep $super_spine $data_file | awk '{print $2}'|sort | uniq `
 as =`grep $super_spine $data_file | awk '{print $3}'|sort | uniq `
 echo "  loopback: $router_id" >> $var_file
 echo "  router_id: $router_id" >> $var_file
 echo "  asn: $asn" >> $var_file
 echo "  bgp_ports: " >> $var_file
 while read src rid sasn snp snip dnip dasn
 do
  echo "   - $snp: "  >> $var_file
  echo "      ip: $snip"    >> $var_file
  echo "      nip: $dnip"   >> $var_file
  echo "      neighbor_as: $dasn"  >> $var_file
  echo ""  >> $var_file
done <  <(cat $data_file | grep $super_spine)
done
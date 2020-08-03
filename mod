echo "enter the contact's id to modify"
read id
if [ $(cut -d: -f1 contacts | grep "^$id$" | wc -c) -eq 0 ];then
echo "contact not found"
else
c=$(grep "^$id" contacts)
first=$(echo $c| cut -d: -f2 | cut -d_ -f1)
email=$(echo $c| cut -d: -f4)
echo "select what to modify"
echo "1- modify last name"
echo "2- modify phone number"
echo "3- modify both last name and phone number"
echo "4- return"
read x
case $x in
1) echo "enter the last name"
read last
phone=$(echo $c | cut -d: -f3)
sed -i "/^$id/d" contacts 
line="$id":
line=$line"$first"
line=$line"_$last"
line=$line:"$phone"
line=$line:"$email"
echo $line >>contacts
echo "the contact modified successfully"
;;
2) echo "enter the phone number"
read phone
echo $phone >file
while [ $(grep '^[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]$' file | wc -c) == 0 ];do
echo "re-enter the phone number"
read phone
echo $phone >file
done
last=$(echo $c| cut -d: -f2 | cut -d_ -f2)
sed -i "/^$id/d" contacts 
line="$id":
line=$line"$first"
line=$line"_$last"
line=$line:"$phone"
line=$line:"$email"
echo $line >>contacts
echo "the contact modified successfully"
;;
3) echo "enter the last name"
read last
echo "enter the phone number"
read phone
echo $phone >file
while [ $(grep '^[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]$' file | wc -c) == 0 ];do
echo "re-enter the phone number"
read phone
echo $phone >file
done
sed -i "/^$id/d" contacts 
line="$id":
line=$line"$first"
line=$line"_$last"
line=$line:"$phone"
line=$line:"$email"
echo $line >>contacts
echo "the contact modified successfully"
;;
4)modify
;;
*)echo "wrong choice"
;;
esac

fi

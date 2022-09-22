#! /bin/bash
while IFS="," read -r rec_column1 rec_column2 
do
  echo "SERVICE: $rec_column1"
  echo "VERSION: $rec_column2"
  echo ""
  export SERVICE=$rec_column1
  export VERSION=$rec_column2
done < <(tail -n 1 version_control.csv)
echo env | grep VERSION | grep SERVICE
echo $SERVICE
echo $VERSION
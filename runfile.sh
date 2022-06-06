#!/bin/bash
echo "Exporting data"
mongoexport --host=convertein.com --port=27017 --db=shop_data  --collection=shop --query="{\"Shop_ID\":\"shopid_1\"}"  --out=input.csv
echo "Successfully exported"
python3 clean.py
python3 copy-ml.py
echo "Now deleting documents"
#mongo shop_data --host=convertein.com --port=27017 --eval 'db.shop.remove({"Shop_ID":"shopid_1"})'
echo "Importing data"
mongoimport --host=convertein.com --port=27017 --type csv -d shop_data -c shop1 --headerline --drop ml-output.csv

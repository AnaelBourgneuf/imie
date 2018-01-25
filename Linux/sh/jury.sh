#!/bin/bash
echo "quelle est votre moyenne ?"   
read moyenne
#echo $moyenne
if [[ moyenne > "16" || moyenne = "16" ]]; then echo très bien;
elif [[ moyenne > "14" || moyenne = "14" ]]; then echo bien;
elif [[ moyenne > "12" || moyenne = "12" ]]; then echo assez bien;
elif [[ moyenne > "10" || moyenne = "10" ]]; then echo moyen;
elif [[ moyenne < "10" ]]; then echo insuffisant;
fi
grn=$'\e[1;32m'
end=$'\e[0m'
SECONDS=0
echo "\n${grn}Getting dependencies in app\n${end}"
fvm flutter pub get;
duration=$SECONDS
echo "${grn}Getting done in $(($duration / 60)) minutes and $(($duration % 60)) seconds.${end}"

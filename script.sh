

#!/bin/sh


echo "script to set up project space and corresponding Github repo"
echo  " the folder structure is shown blewo"

# run from root  wrapper

echo "Please enter name of workspace"
read  workspace
echo "You entered: $workspace"

echo "Please enter some project name"
read  project
echo "You entered: $project"


current=$(pwd) && echo $current


"echo $current .... project ..... $project "

echo  "|-----  $current       script is  run from here"
echo  "|  |----- $workspace   created new work space" 
echo  "        |---- $project   project space"


#install git and curl
apt-get install git curl

git config  --global user.name "Abdul2"
git config --global  user.email "abdulrashid2@gmail.com"


input='{ "name": "x"}'

output=$(echo $input | sed "s|x|$project|g")

echo $output

curl -u "Abdul2" -X POST -d "$output" https://api.github.com/user/repos

echo "***********************************************"
echo "*                                             *"
echo "*                                             *"
echo "*      Github repo created                    *"
echo "*                                             *"
echo "*                                             *"
echo "*                                             *"
echo "***********************************************"


cd ~/

mkdir $workspace
cd $workspace


git clone https://github.com/Abdul2/$project.git

cd $project 

git pull
touch README.md
git add README.md


git commit -m "first commit"

git push

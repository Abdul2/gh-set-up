

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

#output file name
#thisfile=$(echo $(basename $(readlink -nf $0)))

current=$(pwd) && echo $current

#workspace_dir = $current/$workspace
#project_dir = $workspace/$project

"echo $current .... project ..... $project "

echo  "|-----  $current       script is  run from here"
echo  "|  |----- $workspace   created new work space" 
echo  "        |---- $project   project space"


#install git and curl
apt-get install git curl

#clear settings
#git remote rm origin

#tell github who you are


input='{ "name": "x"}'

output=$(echo $input | sed "s|x|$project|g")

echo $output

curl -u "Abdul2" -X POST -d "$output" https://api.github.com/user/repos

cd ~/

mkdir $workspace
cd $workspace
#mkdir  $project
#cd $project


echo $(pwd) 

#git init
#sudo chmod 0600 /.git
touch README.md
sudo chmod 0600 README.md
echo "# $project" >> README.md

git clone https://github.com/Abdul2/$project.git
git config  user.name "Abdul2"

cd $project 

git pull


cp /root/$workspace/README.md  /README.md
cp  /home/abdul/gitHubsetup.sh  /script.sh

git add /root/$workspace/README.md  /home/abdul/gitHubsetup.sh


git commit -m "first commit"
#git remote add origin https://github.com/Abdul2/$project.git
#git branch --set-upstream-to=origin/master master
#git pull
#git push -u origin master
git push

cd "$(dirname "$0")"
git fetch origin master
gitStatus=$(git status -sb)
compare='behind'

if [[ "$gitStatus" == *"$compare"* ]]; then 
    git pull
    rm -rf public
    hugo
    rm -rf /var/www/*
    mv public/* /var/www
fi

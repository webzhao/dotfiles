#!/bin/bash

if [[ "$PWD" == "$HOME" ]]; then
    PROJECT_DIR=".dotfiles"
else
    PROJECT_DIR=`basename $PWD`
fi

ZIP_FILE="dotfiles.zip"
EXTRACT_DIR="dotfiles-master"

git_update()
{
    if [[ -f .vim ]]; then
        echo 'update from git repository'
        git pull origin master
    else
        git clone https://github.com/webzhao/dotfiles.git $PROJECT_DIR
        cd $PROJECT_DIR
        sh install.sh
    fi
}

zip_update()
{
    cd ~
    echo 'update from zip archive'

    # download file
    echo "downloading $ZIP_FILE ..."
    wget https://github.com/webzhao/dotfiles/archive/master.zip --no-check-certificate -q -O $ZIP_FILE

    # unzip archive
    echo "deflating $ZIP_FILE ..."
    rm -rf $EXTRACT_DIR
    unzip -qq $ZIP_FILE
    rm -f $ZIP_FILE
    rm -rf $PROJECT_DIR
    mv $EXTRACT_DIR $PROJECT_DIR

    # install
    echo "creating soft links ..."
    cd $PROJECT_DIR
    sh install.sh
}


# if git installed, update from git repository
# else update from zip archive
if type git > /dev/null; then
    git_update
else
    zip_update
fi

echo "done!"

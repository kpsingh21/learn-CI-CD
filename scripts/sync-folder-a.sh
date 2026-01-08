#!/bin/bash
set -e

TARGET_REPO="repo-A"
TARGET_ORG="kpsingh21"   # same account
TARGET_BRANCH="main"

echo "Syncing folder-A to $TARGET_REPO..."

git config --global user.email "actions@github.com"
git config --global user.name "GitHub Actions"

git clone https://github.com/$TARGET_ORG/$TARGET_REPO.git
rm -rf $TARGET_REPO/*
cp -r folder-A/* $TARGET_REPO/

cd $TARGET_REPO

git add .
git commit -m "Sync folder-a from source repo" || echo "No changes"
git push origin $TARGET_BRANCH

#!/bin/bash

echo -e "\033[0;32mBuilding Site...\033[0m"

hugo

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

git add .
git commit -m "newest blog source deploy `date`"
git push origin main


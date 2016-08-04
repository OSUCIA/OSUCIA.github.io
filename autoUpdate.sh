#!/bin/bash
#Updates the git repository with the club's website based on the files in the
#   main repository
cd Club #Move to the club's main Git folder
git reset --hard origin #Update to the most recent set of files.

for file in *.md; do
  mv -f "$file" ../pages/"$file"
done

cd Minutes
for file in *.md; do
  mv -f "$file" ../../_posts/"$file"
done

cd ../../pages
mv README.md ../index.md

cd ..
jekyll build #Build the site using config defaults

cd OutPut #Move to the output folder, containing the webpage section of the Git
git add * #Add all of the updates
git commit -m "Auto update of webpage based on main git."
git push


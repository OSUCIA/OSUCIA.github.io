#!/bin/bash
#Updates the git repository with the club's website based on the files in the
#   main repository
cd ../Club #Move to the club's main Git folder
git fetch #Fetch most recent update info
git reset --hard origin #Verify files are only what is contained in the git.

rm ../jekyll/pages/*.md

for file in *.md; do
  mv -f "$file" ../jekyll/pages/"$file"
done
rm ../jekyll/pages/By-Laws.md

mv Logo-Transparent.png ../jekyll/
mv favicon.ico ../jekyll/

cd Minutes
rm ../../jekyll/_posts/*.md #Remove all currently shown - to make sure deleted/renamed files aren't displayed.
for file in *.md; do
  mv -f "$file" ../../jekyll/_posts/"$file"
done

cd ../../jekyll/pages
mv README.md ../index.md

cd ..
jekyll build #Build the site using config defaults

cd OutPut #Move to the output folder, containing the webpage section of the Git
git add -A  #Add all of the updates
git commit -m "Auto update of webpage based on main git."
git push

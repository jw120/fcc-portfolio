#!/bin/sh

# Gather files from other projects
for proj in tribute random-quote calculator pomodoro tic-tac-toe
do
    cp -pR ../$proj/dist dist/$proj
done

# Create files in our dist/ directory
cat src/body.css src/header.css src/grid.css src/blog.css src/footer.css >dist/styles.css
cp src/portfolio.js dist/
cp clip-image/dice-white.jpg dist/
cp project-info/*.png dist/
gcc -E -P -x c -I project-info/ src/index.html -o dist/index.html

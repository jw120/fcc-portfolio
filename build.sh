#!/bin/sh

mkdir -p dist

# Gather files from other front-end projects
for proj in tribute random-quote calculator pomodoro tic-tac-toe wikipedia twitch simon
do
    mkdir -p dist/$proj
    cp -pR ../$proj/dist/* dist/$proj
done

# Gather files from create-react-app projects
for proj in data-viz/markdown-previewer data-viz/camper-leaderboard data-viz/recipe-box
do
    mkdir -p dist/${proj##*/}
    cp -pR ../../$proj/build/* dist/${proj##*/}
done

# For weather we use the placeholder files only
for proj in weather
do
    mkdir -p dist/$proj
    cp -pR ../$proj/dist/*placeholder.js dist/$proj
    cp -pR ../$proj/dist/*placeholder.html dist/$proj
    cp -pR ../$proj/dist/*.css dist/$proj
    cp -pR ../$proj/dist/*.png dist/$proj
done

# Data viz projects
for proj in bar-chart
do
    mkdir -p dist/$proj
    cp -pR ../../data-viz/$proj/dist/* dist/$proj
done

# Create files in our dist/ directory
cat src/body.css src/header.css src/grid.css src/blog.css src/contact.css src/footer.css >dist/styles.css
cp src/portfolio.js dist/
cp clip-image/dice-white.jpg dist/
cp project-info/*.png dist/
gcc -E -P -x c -I project-info/ src/index.html -o dist/index.html

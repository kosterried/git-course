#!/bin/bash

dir_at_startup=$(pwd)

reset () {
    echo "Go back to $dir_at_startup"
    cd $dir_at_startup

    echo "Restore clean working directory"
    mkdir -p work
    rm -rf work
    mkdir work
    cd work

    echo "Here we go again!"
}

init_simple_repo () {
    mkdir -p party_planning
    cd party_planning
    git init
    cp ../../examples/flyer_A .
    cp ../../examples/flyer_B .

    git add flyer_A && git commit -m "add flyer_A"
    git add flyer_B && git commit -m "add flyer_B"

    echo "Doors: 22:00" >> flyer_A
    echo "Doors: 21:00" >> flyer_B
    git add * && git commit -m "add opening time"

    echo "Happy Hour: 23:00 - 24:00" >> flyer_A
    echo "Happy Hour: 22:00 - 24:00" >> flyer_B
    git add * && git commit -m "add happy-hour"

    echo ""
    echo "Your commits so far:"
    echo ""
    git log

    echo""
    echo "Your flyers:"
    echo""
    ls
}

    
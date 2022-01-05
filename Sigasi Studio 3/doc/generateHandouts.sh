#!/bin/bash

cat intro.md > Handouts.md
echo '<p style="page-break-after:always;"></p>' >> Handouts.md
cat blank.md >> Handouts.md
echo '<p style="page-break-after:always;"></p>' >> Handouts.md
cat ../part1.md >> Handouts.md
echo '<p style="page-break-after:always;"></p>' >> Handouts.md
cat blank.md >> Handouts.md
echo '<p style="page-break-after:always;"></p>' >> Handouts.md
cat ../part2.md >> Handouts.md
echo '<p style="page-break-after:always;"></p>' >> Handouts.md
cat blank.md >> Handouts.md
echo '<p style="page-break-after:always;"></p>' >> Handouts.md
cat ../part3.md >> Handouts.md
echo '<p style="page-break-after:always;"></p>' >> Handouts.md
cat blank.md >> Handouts.md
echo '<p style="page-break-after:always;"></p>' >> Handouts.md
cat ../part4.md >> Handouts.md
cat outro.md >> Handouts.md

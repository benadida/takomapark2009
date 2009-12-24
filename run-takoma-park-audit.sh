#!/bin/bash
PYTHON=/usr/bin/python

echo "This program runs the verification for the Takoma Park election of November 2009."
echo "It assumes you have downloaded the verification code and audit data."

echo ""
echo ""

echo "creating results directory"
# create a results directory
mkdir results

# go into the audit code
cd verifcode

echo "MEETING 1"
# run meeting1
$PYTHON meeting1.py ../data/PUBLIC/PUBLIC/ward1 > ../results/meeting1-ward1.txt
$PYTHON meeting1.py ../data/PUBLIC/PUBLIC/ward2 > ../results/meeting1-ward2.txt
$PYTHON meeting1.py ../data/PUBLIC/PUBLIC/ward3 > ../results/meeting1-ward3.txt
$PYTHON meeting1.py ../data/PUBLIC/PUBLIC/ward4 > ../results/meeting1-ward4.txt
$PYTHON meeting1.py ../data/PUBLIC/PUBLIC/ward5 > ../results/meeting1-ward5.txt
$PYTHON meeting1.py ../data/PUBLIC/PUBLIC/ward6 > ../results/meeting1-ward6.txt

# copy the djia latest into the right location for each ward
cp ../data/PUBLIC/PUBLIC/djia-stock-prices-14-Oct-09.txt ../data/PUBLIC/PUBLIC/ward1/pre-election-random-data.txt
cp ../data/PUBLIC/PUBLIC/djia-stock-prices-14-Oct-09.txt ../data/PUBLIC/PUBLIC/ward2/pre-election-random-data.txt
cp ../data/PUBLIC/PUBLIC/djia-stock-prices-14-Oct-09.txt ../data/PUBLIC/PUBLIC/ward3/pre-election-random-data.txt
cp ../data/PUBLIC/PUBLIC/djia-stock-prices-14-Oct-09.txt ../data/PUBLIC/PUBLIC/ward4/pre-election-random-data.txt
cp ../data/PUBLIC/PUBLIC/djia-stock-prices-14-Oct-09.txt ../data/PUBLIC/PUBLIC/ward5/pre-election-random-data.txt
cp ../data/PUBLIC/PUBLIC/djia-stock-prices-14-Oct-09.txt ../data/PUBLIC/PUBLIC/ward6/pre-election-random-data.txt

echo "MEETING 2"

# run meeting2
$PYTHON meeting2.py ../data/PUBLIC/PUBLIC/ward1 > ../results/meeting2-ward1.txt
$PYTHON meeting2.py ../data/PUBLIC/PUBLIC/ward2 > ../results/meeting2-ward2.txt
$PYTHON meeting2.py ../data/PUBLIC/PUBLIC/ward3 > ../results/meeting2-ward3.txt
$PYTHON meeting2.py ../data/PUBLIC/PUBLIC/ward4 > ../results/meeting2-ward4.txt
$PYTHON meeting2.py ../data/PUBLIC/PUBLIC/ward5 > ../results/meeting2-ward5.txt
$PYTHON meeting2.py ../data/PUBLIC/PUBLIC/ward6 > ../results/meeting2-ward6.txt

echo "MEETING 3"

# run meeting3
$PYTHON meeting3.py ../data/PUBLIC/PUBLIC/ward1 ../results/confirmation-codes-ward1.csv > ../results/meeting3-ward1.txt
$PYTHON meeting3.py ../data/PUBLIC/PUBLIC/ward2 ../results/confirmation-codes-ward2.csv > ../results/meeting3-ward2.txt
$PYTHON meeting3.py ../data/PUBLIC/PUBLIC/ward3 ../results/confirmation-codes-ward3.csv > ../results/meeting3-ward3.txt
$PYTHON meeting3.py ../data/PUBLIC/PUBLIC/ward4 ../results/confirmation-codes-ward4.csv > ../results/meeting3-ward4.txt
$PYTHON meeting3.py ../data/PUBLIC/PUBLIC/ward5 ../results/confirmation-codes-ward5.csv > ../results/meeting3-ward5.txt
$PYTHON meeting3.py ../data/PUBLIC/PUBLIC/ward6 ../results/confirmation-codes-ward6.csv > ../results/meeting3-ward6.txt

echo "MEETING 3 with provisional ballots"

# run meeting3 + provisional
$PYTHON meeting3provisional.py ../data/PUBLIC/PUBLIC/ward1 ../results/confirmation-codes-inc-provisional-ward1.csv > ../results/meeting3-ward1-inc-provisional.txt
$PYTHON meeting3provisional.py ../data/PUBLIC/PUBLIC/ward2 ../results/confirmation-codes-inc-provisional-ward2.csv > ../results/meeting3-ward2-inc-provisional.txt
$PYTHON meeting3provisional.py ../data/PUBLIC/PUBLIC/ward3 ../results/confirmation-codes-inc-provisional-ward3.csv > ../results/meeting3-ward3-inc-provisional.txt
$PYTHON meeting3provisional.py ../data/PUBLIC/PUBLIC/ward4 ../results/confirmation-codes-inc-provisional-ward4.csv > ../results/meeting3-ward4-inc-provisional.txt
$PYTHON meeting3provisional.py ../data/PUBLIC/PUBLIC/ward5 ../results/confirmation-codes-inc-provisional-ward5.csv > ../results/meeting3-ward5-inc-provisional.txt
$PYTHON meeting3provisional.py ../data/PUBLIC/PUBLIC/ward6 ../results/confirmation-codes-inc-provisional-ward6.csv > ../results/meeting3-ward6-inc-provisional.txt

echo "Tally for Question 0"

# run tally for question 0
$PYTHON tally.py 0 ../data/PUBLIC/PUBLIC/ward1 ../data/PUBLIC/PUBLIC/ward2 ../data/PUBLIC/PUBLIC/ward3 ../data/PUBLIC/PUBLIC/ward4 ../data/PUBLIC/PUBLIC/ward5 ../data/PUBLIC/PUBLIC/ward6 > ../results/tally-question-0.txt

echo "Tally for Question 1"

# run tally for question 1
$PYTHON tally.py 1 ../data/PUBLIC/PUBLIC/ward1 > ../results/tally-ward1.txt
$PYTHON tally.py 1 ../data/PUBLIC/PUBLIC/ward2 > ../results/tally-ward2.txt
$PYTHON tally.py 1 ../data/PUBLIC/PUBLIC/ward3 > ../results/tally-ward3.txt
$PYTHON tally.py 1 ../data/PUBLIC/PUBLIC/ward4 > ../results/tally-ward4.txt
$PYTHON tally.py 1 ../data/PUBLIC/PUBLIC/ward5 > ../results/tally-ward5.txt
$PYTHON tally.py 1 ../data/PUBLIC/PUBLIC/ward6 > ../results/tally-ward6.txt

echo "Tally for Question 0 with provisional"

# run tally for question 0 including provisional
$PYTHON tally-provisional.py 0 ../data/PUBLIC/PUBLIC/ward1 ../data/PUBLIC/PUBLIC/ward2 ../data/PUBLIC/PUBLIC/ward3 ../data/PUBLIC/PUBLIC/ward4 ../data/PUBLIC/PUBLIC/ward5 ../data/PUBLIC/PUBLIC/ward6 > ../results/tally-question-0-inc-provisional.txt

echo "Tally for Question 1 with provisional"

# run tally for question 1 including provisional
$PYTHON tally-provisional.py 1 ../data/PUBLIC/PUBLIC/ward1 > ../results/tally-ward1-inc-provisional.txt
$PYTHON tally-provisional.py 1 ../data/PUBLIC/PUBLIC/ward2 > ../results/tally-ward2-inc-provisional.txt
$PYTHON tally-provisional.py 1 ../data/PUBLIC/PUBLIC/ward3 > ../results/tally-ward3-inc-provisional.txt
$PYTHON tally-provisional.py 1 ../data/PUBLIC/PUBLIC/ward4 > ../results/tally-ward4-inc-provisional.txt
$PYTHON tally-provisional.py 1 ../data/PUBLIC/PUBLIC/ward5 > ../results/tally-ward5-inc-provisional.txt
$PYTHON tally-provisional.py 1 ../data/PUBLIC/PUBLIC/ward6 > ../results/tally-ward6-inc-provisional.txt

# copy the djia latest into the right location for each ward
cp ../data/PUBLIC/PUBLIC/djia-stock-prices-06-Nov-09.txt ../data/PUBLIC/PUBLIC/ward1/post-election-random-data.txt
cp ../data/PUBLIC/PUBLIC/djia-stock-prices-06-Nov-09.txt ../data/PUBLIC/PUBLIC/ward2/post-election-random-data.txt
cp ../data/PUBLIC/PUBLIC/djia-stock-prices-06-Nov-09.txt ../data/PUBLIC/PUBLIC/ward3/post-election-random-data.txt
cp ../data/PUBLIC/PUBLIC/djia-stock-prices-06-Nov-09.txt ../data/PUBLIC/PUBLIC/ward4/post-election-random-data.txt
cp ../data/PUBLIC/PUBLIC/djia-stock-prices-06-Nov-09.txt ../data/PUBLIC/PUBLIC/ward5/post-election-random-data.txt
cp ../data/PUBLIC/PUBLIC/djia-stock-prices-06-Nov-09.txt ../data/PUBLIC/PUBLIC/ward6/post-election-random-data.txt

echo "MEETING 4"

# meeting 4
$PYTHON meeting4.py ../data/PUBLIC/PUBLIC/ward1 > ../results/meeting4-ward1.txt
$PYTHON meeting4.py ../data/PUBLIC/PUBLIC/ward2 > ../results/meeting4-ward2.txt
$PYTHON meeting4.py ../data/PUBLIC/PUBLIC/ward3 > ../results/meeting4-ward3.txt
$PYTHON meeting4.py ../data/PUBLIC/PUBLIC/ward4 > ../results/meeting4-ward4.txt
$PYTHON meeting4.py ../data/PUBLIC/PUBLIC/ward5 > ../results/meeting4-ward5.txt
$PYTHON meeting4.py ../data/PUBLIC/PUBLIC/ward6 > ../results/meeting4-ward6.txt

echo "CONTESTED BALLOTS"

# contested ballots
# which are actually all of the ballots
$PYTHON contested-ballots.py ../data/PUBLIC/PUBLIC/ward1 ../results/contested-ballots-ward1-confirmation-codes.txt > ../results/contested-ballots-ward1.txt
$PYTHON contested-ballots.py ../data/PUBLIC/PUBLIC/ward2 ../results/contested-ballots-ward2-confirmation-codes.txt > ../results/contested-ballots-ward2.txt
$PYTHON contested-ballots.py ../data/PUBLIC/PUBLIC/ward3 ../results/contested-ballots-ward3-confirmation-codes.txt > ../results/contested-ballots-ward3.txt
$PYTHON contested-ballots.py ../data/PUBLIC/PUBLIC/ward4 ../results/contested-ballots-ward4-confirmation-codes.txt > ../results/contested-ballots-ward4.txt
$PYTHON contested-ballots.py ../data/PUBLIC/PUBLIC/ward5 ../results/contested-ballots-ward5-confirmation-codes.txt > ../results/contested-ballots-ward5.txt
$PYTHON contested-ballots.py ../data/PUBLIC/PUBLIC/ward6 ../results/contested-ballots-ward6-confirmation-codes.txt > ../results/contested-ballots-ward6.txt

echo "UNUSED BALLOTS"

# unused ballots
$PYTHON unused-ballots.py ../data/PUBLIC/PUBLIC/ward1 ../results/unused-ballots-ward1-confirmation-codes.csv > ../results/unused-ballots-ward1.txt
$PYTHON unused-ballots.py ../data/PUBLIC/PUBLIC/ward2 ../results/unused-ballots-ward2-confirmation-codes.csv > ../results/unused-ballots-ward2.txt
$PYTHON unused-ballots.py ../data/PUBLIC/PUBLIC/ward3 ../results/unused-ballots-ward3-confirmation-codes.csv > ../results/unused-ballots-ward3.txt
$PYTHON unused-ballots.py ../data/PUBLIC/PUBLIC/ward4 ../results/unused-ballots-ward4-confirmation-codes.csv > ../results/unused-ballots-ward4.txt
$PYTHON unused-ballots.py ../data/PUBLIC/PUBLIC/ward5 ../results/unused-ballots-ward5-confirmation-codes.csv > ../results/unused-ballots-ward5.txt
$PYTHON unused-ballots.py ../data/PUBLIC/PUBLIC/ward6 ../results/unused-ballots-ward6-confirmation-codes.csv > ../results/unused-ballots-ward6.txt

echo "DONE! Check the result directory."
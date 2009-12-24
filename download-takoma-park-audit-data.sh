#!/bin/bash
#
# Ben Adida (ben@adida.net)
# 2009-12-22
#
# This script requires svn and git support
# it downloads the scantegrity audit code

echo "This program downloads the verification code and audit data needed to verify the Takoma Park Election held in November 2009"

echo "Now downloading the audit data"

# load the scantegrity data
svn checkout https://scantegrity.org/svn/data/takoma-nov3-2009 data

echo "Now downloading the audit code"

# load the audit code
git clone http://github.com/benadida/scantegrity-audit.git verifcode

echo "Done downloading, ready to run verification"
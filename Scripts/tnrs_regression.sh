#!/bin/bash


if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    echo .
    echo "Example usage is:"
    echo "    `basename $0` "
    echo .
    exit
fi


# Change to the directory where testsuites are stored
cd $HOME/trunk/TNRS-QA


#  Make sure the output directory exists.  If not, create it.
if [ ! -d "$HOME/junk/RegressionTests_TNRS" ]; then
    mkdir $HOME/junk/RegressionTests_TNRS
fi


# Clean out the output directory
rm -rf $HOME/junk/RegressionTests_TNRS/*


#pybot -A ../../TNRSVars.txt  -o DB-Output.xml -A TNRS_Tests_DB.list
pybot -A ../../TNRSVars.txt --name API -o API-Output.xml -A TNRS_Tests_API.list
pybot -A ../../TNRSVars.txt --name FireFox --variable SShotBase:FireFox --variable BROWSER:ff -o FireFox-Output.xml -A TNRS_Tests_GUI.list
pybot -A ../../TNRSVars.txt --name Chrome -i smoke --variable SShotBase:Chrome --variable BROWSER:chrome -o Chrome-Output.xml -A TNRS_Tests_GUI.list


# Now combine all the results into one report
cd $HOME/junk/RegressionTests_TNRS
if [ -r $HOME/junk/RegressionTests_TNRS/API-Output.xml ] && \
	[ -r $HOME/junk/RegressionTests_TNRS/FireFox-Output.xml ] && \
	[ -r $HOME/junk/RegressionTests_TNRS/Chrome-Output.xml ] ; then
	echo "--------------------------------------------------------------------------"
	echo "- - -   Combining output.xml files from Cleanup and Regression run (DB)"
	echo "--------------------------------------------------------------------------"
	rebot -n TNRS-* \
		--name Clean_Regression \
		$HOME/junk/RegressionTests_TNRS/API-Output.xml \
		$HOME/junk/RegressionTests_TNRS/FireFox-Output.xml \
		$HOME/junk/RegressionTests_TNRS/Chrome-Output.xml
else
	echo "************************************************************"
	echo "* * *   output.xml file missing, no report generated   * * *"
	echo "************************************************************"
fi

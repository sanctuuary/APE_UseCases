# SimpleDemo

This is a basic project used to demonstrate the sysnthesis functionality provided by APE (the Automated Pipeline Explorer). 

## Installation
In order to run the synthesis APE-&lt;version>.jar needs to be available: https://github.com/sanctuuary/APE. Furthermore, in order to be able to execute the generated workflows on the machine, GMT set of tools needs to be installed: http://gmt.soest.hawaii.edu/projects/gmt/wiki/Installing

## Run

In order to execute the synthesis it would be sufficient to provide the APE-&lt;version>.jar in the main .APE_UseCases directory and run the following command:

```shell
 java -jar APE-<version>.jar SimpleDemo/ape.configuration
```
The results of the synthesis would be:

	SimpleDemo/sat_solutions.txt	-	First 100 candidate solutions in textual format
	SimpleDemo/Figures/		-	Data-flow figures corresponding to the first 10 solutions
	SimpleDemo/Implementations/	-	Executable shell scripts corresponding to the first 6 solutions


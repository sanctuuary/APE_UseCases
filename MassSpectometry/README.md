

# Mass spectrometry-based proteomics [No1]

This is a project used to demonstrate the sysnthesis functionality provided by APE (the Automated Pipeline Explorer). 

The use case aims to demonstrate the usefulness of the synthesis approach for solving a workflow discovery problem in bioinformatics. The scenario was demonstrated in [[1]][lamprecht2019].
	**No1** use case describes the 1st Use Case described in the paper, labeled as **No. 1**.

## Installation
In order to run the synthesis APE-&lt;version>.jar needs to be available: https://github.com/sanctuuary/APE. Furthermore, in order to be able to execute the generated workflows on the machine, the tools have to be annotated accordingly, and the cooresponding software should be available.
## Run

In order to execute the synthesis it would be sufficient to provide the APE-&lt;version>.jar in the main .APE_UseCases directory and run the following command:

```shell
 java -jar APE-<version>.jar BioTools_No1/ape.configuration
```
The results of the synthesis would be:

	MassSpectometry/No1/sat_solutions.txt	-	First 100 candidate solutions in textual format
	MassSpectometry/No1/Figures/		-	Data-flow figures corresponding to the first 10 solutions
	MassSpectometry/No1/Implementations/	-	Executable shell scripts corresponding to the first 6 solutions


[lamprecht2019]: https://doi.org/10.1093/bioinformatics/bty646 "Automated workflow composition in mass spectrometry-based proteomics."

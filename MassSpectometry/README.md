

# Mass spectrometry-based proteomics [No1]

This is a project used to demonstrate the sysnthesis functionality provided by APE (the Automated Pipeline Explorer). 

The use case aims to demonstrate the usefulness of the synthesis approach for solving a workflow discovery problem in bioinformatics. The scenario was demonstrated in [[1]][lamprecht2019].
	**No1** use case describes the 1st Use Case described in the paper, labeled as **No. 1**
	**No2** use case describes the 2nd Use Case described in the paper, labeled as **No. 2**
	**No3** use case describes the 3rd Use Case described in the paper, labeled as **No. 3**
	**No4** use case describes the 4th Use Case described in the paper, labeled as **No. 4**

## Installation
In order to run the synthesis APE-&lt;version>.jar needs to be available: https://github.com/sanctuuary/APE. Furthermore, in order to be able to execute the generated workflows on the machine, the tools have to be annotated accordingly, and the cooresponding software should be available.
## Run

In order to execute the synthesis it would be sufficient to provide the APE-&lt;version>.jar in the main .APE_UseCases directory and run one of the following commands:

```shell
 java -jar APE-<version>.jar MassSpectometry/No<number 1-4>/config_original.json
 java -jar APE-<version>.jar MassSpectometry/No<number 1-4>/config_extended.json
 java -jar APE-<version>.jar MassSpectometry/No<number 1-4>/config_full_bio.tools.json
```
Each of the cofiguration files will be run with a different size of the domain set.
	1. The original domain comprises 20 handpicked proteomics tools (originally used in the paper)
	2. The extended domain comprises all the tool available in bio.tools from the Proteomics domain
	3. Full domain comprises all the tools available and properly annotated in bio.tools


The results of the synthesis would be:

	MassSpectometry/No1/sat_solutions.txt	-	First x candidate solutions in textual format
	MassSpectometry/No1/Figures/		-	Data-flow figures corresponding to the first X solutions


[lamprecht2019]: https://doi.org/10.1093/bioinformatics/bty646 "Automated workflow composition in mass spectrometry-based proteomics."

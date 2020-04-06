
# APE_UseCases

The project cointains different scenarios where APE (the Automated Pipeline Explorer) can be used to automate the workflow composition. Most of the UseCases are modeling and trying to solve real-life problems in diferent domains (e.g. bioinformatisc, GIS).

In order to use the APE library from the command line, simple run the APE-<version>.jar file using command:

    java -jar APE-<version>.jar

while ape.config file needs to be provided in the same folder or 

    java -jar APE-<version>.jar [path_to_ape.config_file]

If you want to be able to run the executable shell scipts of the demo examples, GMT set of tools needs to be installed .
http://gmt.soest.hawaii.edu/projects/gmt/wiki/Installing

#### Note: 
Errors regarding SLF4J will not affect the synthesis execution and can be ignored. The same goes for possible warnings.

------------


### APE API

The library support API usage as well, and the corresponding documentation is provided in "APE-<version>-sources.jar".


------------

## List of use cases

Each of the uses cases represent a different scenario 

- /**SimpleDemo** - a basic demonstration case of generating maps using automaticaly synthesised scripts
- /**GeoGMT** - case of solving a problem of map creation presented it [[Kasalica and Lamprecht, 2020]][kasalicalamprecht2019]
  - /**E0** - focuses on the initial workflow sinthesys step, labeled as **E0** in the paper.
  - /**E1** - focuses on synthesis of an extended workflow (w.r.t. *E0*), labeled as **E1** in the paper (Extension 1: Annotations).
- /**MassPectometry** - case of automated workflow composition in bioinformatics. more specifically mass spectrometry-based proteomics  [[Palmblad et al., 2019]][lamprecht2019]. 
  - /**No1** - use case describes the 1st Use Case described in the paper, labeled as **No. 1**.
------------



## Configuration file

ape.config is the main configuration file for the library and it consists of the following elements:

	ontology_path 			- 	path to the taxonomy file  (provided demo example taxonomy.owl)
	toolsTaxonomyRoot		-	name of the root tool class
	dataTaxonomyRoot		-	name of the root data taxonomy class
	dataSubTaxonomyRoot[]		-	list of sub-roots within the data taxonomy, each sub-root represents data dimension (e.g. 							data format, data type, etc.)
	tool_annotations_path		-	path to the JSON file that contains basic tool annotation (provided demo example
						tool_annotations.json)
	constraints_path	  -	path to the JSON file containing constraints representing workflow specification 
						(optional)
	shared_memory			-	true in a case of shared-memory structure, false if the message passing structure should 
 						be used
	solutions_path			-	path to the file where the workflow solutions will be written
	solution_min_length		-	minimum length from which solutions should be searched
	solution_max_length		-	maximum length to which solutions should be searched, put 0 in case of no limit
	max_solutions			-	max number of solutions that would be returned
	execution_scripts_folder	-	folder where the executable scripts will be generated
	number_of_execution_scripts	-	number of executable scripts that will be generated
	solution_graphs_folder		-	folder where the graphical representation of the workflows will be generated
	number_of_generated_graphs	-	number of workflow figures that will be generated
	inputs []			-	each input represent a single instance that will be an input to the program
	inputs[]/{}			-	each of the inputs can be described using the terms from data taxonomy, the tags used (in 							our example "TypesTaxonomy" reflects the corresponding taxonomy sub-root
	outputs	[]			-	each output represent a single instance that will be an output of the program
	outputs[]/{}			-	each of the inputs can be described using the terms from data taxonomy, the tags used (in 							our example "TypesTaxonomy" reflects the corresponding taxonomy sub-root
	debug_mode  [optional]		-	true for debug command line output (default value is false)
	use_workflow_input  [optional]	- 	'ALL' if all the workflow inputs have to be used, 'ONE' if one of the workflow inputs
						should be used or 'NONE' if none of the workflow inputs has to be used 
						(default value is ALL)
	use_all_generated_data  [optional]	- 'ALL' if all the generated data has to be used, 'ONE' if one of the data instances 
						that are generated as output, per tool, has to be used or 'NONE' if none of the data
						instances is obligatory to use (default value is ONE)

------------



##  Taxonomy file

##### Demo file: 'SimpleDemo/GMT_Demo_UseCase.owl'

Used to classify tools and data types into 2 different categories. General structure is that the main class "thing" has 2 subclasses, **Tools** and **Data** taxonomies. Furthermore, Data taxonomy consists of multiple subtaxpnpmies, where each represents a **dimension** of data, in the following example we discuss 2 different dimensions of data, namely, data *type* and data *format*.
- **thing** (root class in the OWL file)
  - **Tools Taxonomy** (name provided as modulesTaxonomyRoot in config file)
  - **Data Taxonomy** (name provided as dataTaxonomyRoot in config file)
     -  **Type Taxonomy** (name provided under dataSubTaxonomyRoot in config file)
     - **Format Taxonomy** (name provided under dataSubTaxonomyRoot in config file) [optional]

Tools Taxonomy consists of actual tools from the domain, as well as their abstraction classes.
Type Taxonomy consists of actual data types from the domain, as well as their abstraction classes.
Format Taxonomy consists of actual data Format from the domain, as well as their abstraction classes.

Idea behind using a Format Taxonomy, is that a certain data instance can be defined using a pair, Data Type and Data Format. Thus, Format Taxonomy is optional. The usage can be generalised and the structure allows arbitrary number of such data dimensions to be described.


Note:
Encoding supports explicit subclass relations in RDF format. The rest of the OWL file annotations will be omitted.



------------


## Tool Annotations file

##### Demo file: 'SimpleDemo/tool_annotations.json'
The file has the following structure:

    functions
    	+function
    		ID
    		label
       		taxonomyOperations[]
    		?inputs[]
    			+input
    				+dataSubTaxonomyRoot:[taxonomyTerm]
    		?outputs[]
    			+output
    				+dataSubTaxonomyRoot:[taxonomyTerm]
    		?implementation
    			code

where (+) requires 1 or more, (?) requires 0 or 1 and no sign requires existence of exactly 1 such tag.

Regarding the semantics:

    function		-	an implementation/instance of a tool
    ID			-	unique identifier of the tool
    label			-	display label of the tool implementation
    taxonomyOperations - operations from the tool taxonomy that the current function implements
    input			-	a single input of the workflow
    output			-	a single output of the workflow
    dataSubTaxonomyRoot	-	data type that describes the input/output (each taxonomyTerm from the [taxonomyTerm] list has to belong to the corresponding 	subTaxonomy)
    code		-	code that will be used to implement the workflow as a script

Simplified table representation of our tool annotations is provided in 'res/tool_annotations.png'

------------



## Constraints File

##### Demo file: 'SimpleDemo/constraints.json'

The list of all the natural language templates is provided in 'SimpleDemo/constraints templates.json'. As an example we will present one of the constraint templates, namely "if then generate type" is represented as follows:

	{
	   "constraintid": "gen_ite_t",
	   "description": "If we have generated data type ${parameter_1}, then generate type ${parameter_2} subsequently.",
	   "parameters": [
		  ["${parameter_1}"],
		  ["${parameter_2}"]
	   ]
	}

where both `"${parameter_1}" `and `"${parameter_1}"` represent a sequence of one or more data terms. The following encoding represents a use of such constraint in practice (tag `"description"` is not obligatory):

```json
{
   "constraintid": "gen_ite_t",
   "parameters": [
      ["article","docx"],
      ["article","pdf"]
   ]
}
```
The constraint is interpreted as: 
"If an **article** in **docx** format was generated, then an **article** in **pdf** format has to be generated subsequently."



------------

[kasalicalamprecht2019]: https://doi.org/10.1007/978-3-030-24302-9_34 "Workflow Discovery Through Semantic Constraints: A Geovisualization Case Study"
[lamprecht2019]: https://doi.org/10.1093/bioinformatics/bty646 "Automated workflow composition in mass spectrometry-based proteomics."


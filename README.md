
# APE_UseCases

The project cointains different scenarios where APE (the Automated Pipeline Explorer) can be used to automate the workflow composition. Most of the UseCases are modeling and trying to solve real-life problems in diferent domains (e.g. bioinformatisc, GIS).

### Run APE from the command line
In order to use the APE library from the command line, simply run the `APE-<version>-executable.jar` file using command:


    java -jar APE-<version>-executable.jar [path_to_ape.config_file]
    

As an example, if you would download the [`APE-1.0.2-executable.jar`](https://repo.maven.apache.org/maven2/io/github/sanctuuary/APE/1.0.2/APE-1.0.2-executable.jar) to the root of this repository on your local machine, you could run a [demo use case](https://github.com/sanctuuary/APE_UseCases/tree/master/ImageMagick) by executing the following command:



    cd ~/git/APE_UseCases
    
    java -jar APE-1.0.2-executable.jar ImageMagick/Example1/config.json


------------


### Run APE API

The library support API usage as well, and the corresponding documentation is provided at [APE javadoc.io](https://javadoc.io/doc/io.github.sanctuuary/APE/latest/nl/uu/cs/ape/sat/APE.html) page or by downloading the corresponding [`APE-\<version>-sources.jar`](https://repo.maven.apache.org/maven2/io/github/sanctuuary/APE/1.0.2/APE-1.0.2-javadoc.jar). A simple example of runing APE, after [importing it to your project](https://github.com/sanctuuary/APE#how-to-add-ape-to-your-maven-project) is:
```java
// set up the framework
APE ape = new APE("~/git/APE_UseCases/mageMagic/Example1/config.json");

// run the synthesis
SATsolutionsList solutions = ape.runSynthesis("~/git/APE_UseCases/mageMagic/Example1/config.json");
// write the solutions for the file system
APE.writeSolutionToFile(solutions);
APE.writeDataFlowGraphs(solutions, RankDir.TOP_TO_BOTTOM);
APE.writeExecutableWorkflows(solutions);
```


------------

## List of use cases

Each of the uses cases represent a different scenario 

- [/**ImageMagick**](/ImageMagick) - a basic demonstration case of editing and constructing images using automaticaly synthesised scripts
  - [/**Example1**](/ImageMagick/Example1) - generate a postcard from an image
  - [/**Example2**](/ImageMagick/Example2) - change one color in the image to another color
- [/**GeoGMT**](/GeoGMT) - case of solving a problem of map creation presented it [[Kasalica and Lamprecht, 2020]][kasalicalamprecht2019]
  - [/**E0**](/GeoGMT/E0) - focuses on the initial workflow sinthesys step, labeled as **E0** in the paper.
  - [/**E1**](/GeoGMT/E1) - focuses on synthesis of an extended workflow (w.r.t. *E0*), labeled as **E1** in the paper (Extension 1: Annotations).
- [/**MassSpectometry**](/MassSpectometry) - case of automated workflow composition in bioinformatics. more specifically mass spectrometry-based proteomics  [[Palmblad et al., 2019]][lamprecht2019]. 
  - [/**No1**](/MassSpectometry/No1) - use case describes the 1st Use Case described in the paper, labeled as **No. 1**.
------------


## Configuration file

APE requires an configuration file to set up the framework. This includes the domain ontology and tool annotations. After the framework is initialized, you can run APE by providing a run configuration.
These configurations are in JSON format and could be joined together to serve as a setup- as well as a run configuration, because APE will only read the required fields.
Examples of configurations can be found in Example [1](/ImageMagick/Example1) and [2](/ImageMagick/Example2).

### Core configuration

|Tag                     |Description                                                                                                            |
|------------------------|-----------------------------------------------------------------------------------------------------------------------|
|`ontology_path`           |path to the taxonomy file  (provided demo example taxonomy.owl)                                                        |
|`ontologyPrexifIRI`       |absolute IRI to identify thhe elements in the taxonomy file                                                            |
|`toolsTaxonomyRoot`       |name of the root tool class                                                                                            |
|`dataDimensionsTaxonomyRoots[]`   |list of roots within the data taxonomy, each sub root represents data dimension (e.g. data format, data type, etc.)|
|`tool_annotations_path`   |path to the JSON file that contains basic tool annotation (provided demo example tool_annotations.json)                |


### Run configuration

|Tag                     |Description                                                                                                            |Default|
|------------------------|-----------------------------------------------------------------------------------------------------------------------|-------|
|`constraints_path`        |path to the JSON file containing constraints representing workflow specification		                          | No constraints |
|`solution_min_length`     |minimum length from which solutions should be searched                                                                 |       |
|`solution_max_length`     |maximum length to which solutions should be searched, put 0 in case of no limit                                        |       |
|`max_solutions`           |max number of solutions that would be returned                                                                         |       |
|`solutions_path`          |path to the file where the workflow solutions will be written  (in textual format)                                     |No textual output	|
|`execution_scripts_folder`|folder where the executable scripts will be generated                                                                  |No shell scripts |
|`solution_graphs_folder`  |folder where the graphical representation of the workflows will be generated                                           |No graphics |
|`number_of_execution_scripts` |number of executable scripts that will be generated                                                                    |0      |
|`number_of_generated_graphs` |number of workflow figures that will be generated                                                                      |0      |
|`inputs[]`               |each input represent a single instance that will be an input to the program                                            | No inputs |
|`inputs[]/{}`             |each of the inputs can be described using the terms from data taxonomy, the tags used (in our example "TypesTaxonomy" reflects the corresponding taxonomy sub root|       |
|`outputs[]`              |each output represent a single instance that will be an output of the program                                          |No outputs |
|`outputs[]/{}`            |each of the inputs can be described using the terms from data taxonomy, the tags used (in our example "TypesTaxonomy" reflects the corresponding taxonomy sub root|       |
|`shared_memory`           |true in a case of shared, memory structure, false if the message passing structure should be used                      |TRUE   |
|`debug_mode`              |true for debug command line output                                                                                     |FALSE  |
|`use_workflow_input`      |ALL' if all the workflow inputs have to be used, 'ONE' if one of the workflow inputs should be used or 'NONE' if none of the workflow inputs has to be used (default value is ALL)|ALL    |
|`use_all_generated_data`  |ALL' if all the generated data has to be used, 'ONE' if one of the data instances that are generated as output, per tool, has to be used or 'NONE' if none of the data instances is obligatory to use|ONE    |



##  Taxonomy file

##### Demo file: [ImageMagick/imagemagick_taxonomy.owl](https://github.com/sanctuuary/APE_UseCases/blob/master/ImageMagick/imagemagick_taxonomy.owl)

Used to classify tools and data types into 2 different categories. General structure is that the main class "thing" has 2 subclasses, **Tools** and **Data** taxonomies. Furthermore, Data taxonomy consists of multiple subtaxpnpmies, where each represents a **dimension** of data, in the following example we discuss 2 different dimensions of data, namely, data *type* and data *format*.
- **thing** (root class in the OWL file)
  - **Tools Taxonomy** (URI provided as modulesTaxonomyRoot in config file)
  - **Type Taxonomy** (URI provided under **dataDimensionsTaxonomyRoots** in config file)
  - **Format Taxonomy** (URI provided under **dataDimensionsTaxonomyRoots** in config file)
**Tools Taxonomy** consists of terms that describes operations from the domain, these are called abstraction operations and they usually gropu concrete operations.
**Type Taxonomy** consists of actual data types from the domain, as well as the abstraction classes that subsume them.
**Format Taxonomy** consists of actual data Format from the domain, as well as the abstraction classes that subsume them.

Idea behind using a Format Taxonomy, is that a certain data instance require both, *data type* and *data format* to be identified. Thus, these are called dimensions of data. Having more than one data dimension is optional. Some use cases only one data dimension (see [GeoGMT](GeoGMT)), while some can have more than two.

A concrete example of a domain taxonomy can be find [here](https://github.com/sanctuuary/APE_UseCases/tree/master/ImageMagick#domain-ontology).

#### Note: 
Encoding supports explicit subclass relations in RDF format. The rest of the OWL file annotations will be omitted.



------------


## Tool Annotations file

##### Demo file: [ImageMagick/tool_annotations.json](https://github.com/sanctuuary/APE_UseCases/blob/master/ImageMagick/tool_annotations.json)
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
    taxonomyOperations 	- 	operations from the tool taxonomy (#taxonomy-file) that the current function implements
    input			-	a single input of the workflow
    output			-	a single output of the workflow
    dataSubTaxonomyRoot	-	data type that describes the input/output (each taxonomyTerm from the [taxonomyTerm] list has to belong to the corresponding subTaxonomy)
    code		-	code that will be used to implement the workflow as a script

A concrete example of tool annotations can be find [here](https://github.com/sanctuuary/APE_UseCases/tree/master/ImageMagick#tool-annotation).

------------



## Constraints File

##### Demo file: [ImageMagick/Example1/constraints.json](https://github.com/sanctuuary/APE_UseCases/blob/master/ImageMagick/Example1/constraints.json)

The list of all the natural language templates is provided in 'SimpleDemo/constraints templates.json'. As an example we will present one of the constraint templates, namely "if then generate type" is represented as follows:

	{
	   "constraintid": "gen_ite_t",
	   "description": "If we have generated data type ${parameter_1}, then generate type ${parameter_2} subsequently.",
	   "parameters": [
		  ["${parameter_1}"],
		  ["${parameter_2}"]
	   ]
	}

where both `"${parameter_1}" `and `"${parameter_2}"` represent a sequence of one or more data terms. The following encoding represents a use of such constraint in practice (tag `"description"` is not obligatory):

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


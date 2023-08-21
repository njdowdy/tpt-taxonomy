# TPT Taxonomy Resource Hub
## Foundational Taxonomic Resources For The Terrestrial Parasite Tracker (TPT) Project

[![DOI](https://zenodo.org/badge/414722624.svg)](https://zenodo.org/badge/latestdoi/414722624)

This repository is meant to facilitate access to taxonomic resources produced by the Terrestrial Parasite Tracker project. These resources were compiled from various experts and organizations and cleaned. This process is iterative and should not be considered "final". However, this repository constitutes the most up-to-date view of these resources at the time of upload. Improvements to these resources will be reflected here until further notice.

Taxonomy files are given in two formats, "standardized" files that have the same headers across all taxa given on this page, and "symbiota compatible" files that have been specifically formatted for easier upload to symbiota based portals and databases. 

R scripts used for cleaning general and specific taxon files are available from the following pages:
 - [Siphonaptera](https://github.com/Jegelewicz/tpt-siphonaptera)
 - [Ixodes](https://github.com/njdowdy/ixodes-tpt)
 - [Acari](https://github.com/Jegelewicz/tpt-acari) (Mayfield-Meyer), [Acari](https://github.com/njdowdy/tpt-acari-taxonomy.git) (Dowdy)
 - [TaxoTools](https://github.com/vijaybarve/taxotools)

If you have questions, new names to add, and/or would like to contribute to the project, please contact us.


### Contact Information
Principal Investigator: <a href="mailto: zaspelj@mpm.edu" target="_blank">Dr. Jennifer Zaspel</a><br />
Taxonomy Coordinator (2021-2022): <a href="mailto: emtuckerlab@gmail.com" target="_blank">Dr. Erika Tucker</a><br />
GitHub Repository: <a href="https://github.com/njdowdy" target="_blank">Dr. Nicolas J. Dowdy</a><br />

Short link to this page: https://bit.ly/TPTresourceHub

---

# Instructions for Use
There are two basic ways to use the information provided in this repository:
## 1. Download Name Lists
* See next section <b> Download File Help </b> to download available ready to use name lists for research, as database backbones, etc. Name lists can also be used as a starting point for compiling, cleaning, improving, and producing new lists (see "2. Clean Name Lists" below). 

## 2. Clean Name Lists
* Copy the R-scripts used for name list cleaning:
  * [Siphonaptera](https://github.com/Jegelewicz/tpt-siphonaptera)
  * [Ixodes](https://github.com/njdowdy/ixodes-tpt)
  * [Acari](https://github.com/Jegelewicz/tpt-acari) (Mayfield-Meyer), [Acari](https://github.com/njdowdy/tpt-acari-taxonomy.git) (Dowdy)
  * [TaxoTools](https://github.com/vijaybarve/taxotools)
* Read additional use information given in [TaxoTools](https://github.com/vijaybarve/taxotools) documention.
* Modify and adjust R-scripts to run on your specific name lists
* Share name lists and scripts with us to add to the repository and improve taxonomic data sharing and transparency

---

# File Download Help
## Option 1: 
* Click file link to raw page
   * Click download button to view raw data on screen
   * View or copy data to file
   
   **OR**
   
   * Right click download button and select "save as" to download .csv file

 ## Option 2: 
 * Right click file link and select "save as" to download immediately

   
---

# Data Files & Associated Information
# Parasite Taxa

## Acari (excluding Ixodes)
File (standard format): <a href="./Acari/Acari-standardized-v2.csv" target="_blank">Acari-standardized-v2.csv</a> <br /> 
File (symbiota compatible): <a href="./Acari/Acari-v2-symbiota.csv" target="_blank">Acari-v2-symbiota.csv</a><br />
Source: University of Michigan<br />
Source Contact: <a href="https://webapps.lsa.umich.edu/ummz/insects/personnel/personnelDetail.asp?ID=21" target="_blank">Dr. Barry O’Connor</a><br />
Taxonomic Resource Contact: <a href="https://github.com/Jegelewicz" target="_blank">@Jegelewicz</a><br />
Description: A list of acarian names<br />
Status: DarwinCore compliant<br />
Older archived file versions are available <a href="https://github.com/njdowdy/tpt-taxonomy/tree/main/Acari" target="_blank">here</a> <br />
<br> _Recommended Citation:_ <br>
* [Barry O’Connor](https://lsa.umich.edu/ummz/people/curators-staff/bmoc.html), [Hans Klompen](https://eeob.osu.edu/people/klompen.1). Terrestrial Parasite Tracker Acari (excluding Ixodes) Name List. _GitHub:_ [Dataset]. Download date. 

## Diptera
Filename: NA<br />
Source: <a href="http://www.diptera.org/" target="_blank">Systema Dipterorum</a>; Bishop Museum<br />
Source Contact: <a href="http://hbs.bishopmuseum.org/staff/evenhuis.html" target="_blank">Dr. Neal L. Evenhuis</a><br />
Taxonomic Resource Contact: <a href="https://github.com/vijaybarve" target="_blank">@vijaybarve</a><br />
Description: A list of dipteran names<br />
Status: Redacted due to insufficient sharing permissions<br />

## Ixodida
File (standard format): <a href="./Ixodida/Ixodida-standardized-v2.csv" target="_blank">Ixodida-standardized-v2.csv</a><br /> 
File (symbiota compatible): <a href="./Ixodida/Ixodida-v2-symbiota.csv" target="_blank">Ixodida-v2-symbiota.csv</a><br />
Source: US National Tick Collection; Georgia Southern University<br />
Source Contact: <a href="http://lorenzabeati.klacto.net/" target="_blank">Dr. Lorenza Beati</a><br />
Taxonomic Resource Contact: <a href="https://github.com/njdowdy" target="_blank">@njdowdy</a><br />
Description: A list of Ixodida names<br />
Status: DarwinCore compliant; no synonyms provided<br />
Older archived file versions are available [here](https://github.com/njdowdy/tpt-taxonomy/tree/main/Ixodida)<br />
<br> _Recommended Citation:_ <br>
* [Lorenza Beati](https://cosm.georgiasouthern.edu/biology/people/faculty/lorenza-beati/), [Mike Teglas](https://www.unr.edu/eecb/people/mike-teglas). Terrestrial Parasite Tracker Ixodida Name List. _GitHub:_ [Dataset]. Download date. 

## Phthiraptera
File (standard format): <a href="./Phthiraptera/Phthiraptera-standardized-v2.csv" target="_blank">Phthiraptera-standardized-v2.csv</a> <br />
File (symbiota compatible): <a href="./Phthiraptera/Phthiraptera-v2-symbiota.csv" target="_blank">Phthiraptera-v2-symbiota.csv</a><br />
Source: TPT Louse Team<br />
Source Contact: <a href="https://www.unr.edu/biology/faculty/julie-allen" target="_blank">Dr. Julie Allen</a><br />
Taxonomic Resource Contact: <a href="https://github.com/vijaybarve" target="_blank">@vijaybarve</a><br />
Description: A list of phthirapteran names<br />
Status: Partial DarwinCore compliance; TaxoList format<br />
Older archived file versions are available [here](https://github.com/njdowdy/tpt-taxonomy/tree/main/Siphonaptera) <br />
<br> _Recommended Citation:_ <br>
* [Julie Allen](https://www.unr.edu/biology/faculty/julie-allen), [Sarah Bush](http://darwin.biology.utah.edu/Biopages/BushBio.html), [Jessica Light](https://wfsc.tamu.edu/people/light-jessica/), [Jason Weckstein](https://drexel.edu/coas/faculty-research/faculty-directory/weckstein-jason/). Terrestrial Parasite Tracker Phthiraptera Name List. _GitHub:_ [Dataset]. Download date. 

## Siphonaptera
File (standard format): <a href="./Siphonaptera/Siphonaptera-standardized-v2.csv" target="_blank">Siphonaptera-standardized-v2.csv</a> <br /> 
File (symbiota compatible): <a href="./Siphonaptera/Siphonaptera-v2-symbiota.csv" target="_blank">Siphonaptera-v2-symbiota.csv</a><br />
Source: <a href="https://biology.byu.edu/fleas-of-the-world" target="_blank">Fleas of the World Database</a>; Brigham Young University<br />
Source Contact: <a href="https://mlbean.byu.edu/curators-and-collection-managers" target="_blank">Michael Hastriter</a><br />
Taxonomic Resource Contact: <a href="https://github.com/Jegelewicz" target="_blank">@Jegelewicz</a><br />
Description: A list of siphonateran names<br />
Status: DarwinCore compliant<br />
Older archived file versions are available [here](https://github.com/njdowdy/tpt-taxonomy/tree/main/Siphonaptera) <br />
<br> _Recommended Citation:_ <br>
* [Michael Hastriter](https://species.wikimedia.org/wiki/Michael_W._Hastriter). Terrestrial Parasite Tracker Siphonaptera Name List. _GitHub:_ [Dataset]. Download date.

# Host Taxa

## Aves
File (standard format): <a href="./host_files/Aves-standardized-v2.csv" target="_blank">Aves-standardized-v2.csv</a> <br />
File (symbiota compatible): <a href="./host_files/Aves-v2-symbiota.csv" target="_blank">Aves-v2-symbiota.csv</a><br />
Source: [IOC World Bird](https://www.worldbirdnames.org/new/) <br />
Source Contact:<br />
Taxonomic Resource Contact: <a href="https://github.com/vijaybarve" target="_blank">@vijaybarve</a><br />
Description: A list of avian names<br />
Status: Partial DarwinCore compliance; no synonyms<br />
Older archived file versions are available [here](https://github.com/njdowdy/tpt-taxonomy/tree/main/host_files) <br />
<br> _Recommended Citation:_ <br>
* [Jason Weckstein](https://drexel.edu/coas/faculty-research/faculty-directory/weckstein-jason/), [VertNet](http://vertnet.org/). Terrestrial Parasite Tracker Aves Name List. _GitHub:_ [Dataset]. Download date.


## Mammalia
File (standard format): <a href="./host_files/Mammalia-standardized-v2.csv" target="_blank">Mammalia-standardized-v2.csv</a> <br />
File (symbiota compatible): <a href="./host_files/Mammalia-v2-symbiota.csv" target="_blank">Mammalia-v2-symbiota.csv</a> <br />
Source: [ASM Mammal Diversity Database](https://www.mammaldiversity.org/) <br />
Source Contact:<br />
Taxonomic Resource Contact: <a href="https://github.com/vijaybarve" target="_blank">@vijaybarve</a><br />
Description: A list of mammalian names<br />
Status: Partial DarwinCore compliance; no synonyms<br />
Older archived file versions are available [here](https://github.com/njdowdy/tpt-taxonomy/tree/main/host_files) <br />
<br> _Recommended Citation:_ <br>
* [ASM Mammal Diversity Database](http://www.mammaldiversity.org/), [Mammal Species of the World](https://www.departments.bucknell.edu/biology/resources/msw3/), [Jessica Light](https://wfsc.tamu.edu/people/light-jessica/), [VertNet](http://vertnet.org/). Terrestrial Parasite Tracker Mammalia Name List. _GitHub:_ [Dataset]. 


---

This page can also be linked to using this address: https://bit.ly/TPTresourceHub

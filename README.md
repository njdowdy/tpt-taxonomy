# tpt-taxonomy
## Foundational Taxonomic Resources For The Terrestrial Parasite Tracker (TPT) Project

[![DOI](https://zenodo.org/badge/414722624.svg)](https://zenodo.org/badge/latestdoi/414722624)

This repository is meant to facilitate access to taxonomic resources produced by the Terrestrial Parasite Tracker project. These resources were compiled from various experts and organizations and cleaned. This process is iterative and should not be considered "final". However, this repository constitutes the most up-to-date view of these resources at the time of upload. Improvements to these resources will be reflected here until further notice.

Taxonomy files with the “-standardized” ending contain the same data as the matching files with the same name, but with “standardized” headers. That is, all the “standardized” files have the same header names and the columns are arranged in the same order. The same core data as in the original files was used for the “standardized” files and just fit as best as possible to these headers. The metadata file describes the headers used in the “standardized” files and gives links to any DwC terms. \
**Version 2** standardized files, "-standardized-v2", have a significant number of name fixes and previously missing taxon names filled in.

Taxonomy files with the extension "-symbiota" have been specifically reformatted to to be compatible with symbiota based portals and databases. 

R scripts used for cleaning general and specific taxon files are available from the following pages:
 - [Siphonaptera](https://github.com/Jegelewicz/tpt-siphonaptera)
 - [Ixodes](https://github.com/njdowdy/ixodes-tpt)
 - [Acari](https://github.com/Jegelewicz/tpt-acari) (Mayfield-Meyer), [Acari](https://github.com/njdowdy/tpt-acari-taxonomy.git) (Dowdy)
 - [TaxoTools](https://github.com/vijaybarve/taxotools)


# Contact Information
Principal Investigator: <a href="mailto: zaspelj@mpm.edu" target="_blank">Dr. Jennifer Zaspel</a><br />
Taxonomy Coordinator (2021-2022): <a href="mailto: emtuckerlab@gmail.com" target="_blank">Dr. Erika Tucker</a><br />
GitHub Repository: <a href="https://github.com/njdowdy" target="_blank">Dr. Nicolas J. Dowdy</a><br />

# Parasite Taxa

## Acari (excluding Ixodes)
Filename: <a href="./acari.csv" target="_blank">acari.csv</a>; 
<a href="./Acari-standardized-v2.csv" target="_blank">Acari-standardized-v2.csv</a>; 
<a href="./Acari-v2-symbiota.csv" target="_blank">Acari-v2-symbiota.csv</a><br />
Source: University of Michigan<br />
Source Contact: <a href="https://webapps.lsa.umich.edu/ummz/insects/personnel/personnelDetail.asp?ID=21" target="_blank">Dr. Barry O’Connor</a><br />
Taxonomic Resource Contact: <a href="https://github.com/Jegelewicz" target="_blank">@Jegelewicz</a><br />
Description: A list of acarian names<br />
Status: DarwinCore compliant<br />

## Diptera
Filename: NA<br />
Source: <a href="http://www.diptera.org/" target="_blank">Systema Dipterorum</a>; Bishop Museum<br />
Source Contact: <a href="http://hbs.bishopmuseum.org/staff/evenhuis.html" target="_blank">Dr. Neal L. Evenhuis</a><br />
Taxonomic Resource Contact: <a href="https://github.com/vijaybarve" target="_blank">@vijaybarve</a><br />
Description: A list of dipteran names<br />
Status: Redacted due to insufficient sharing permissions<br />

## Ixodes
Filename: <a href="./ixodes.csv" target="_blank">ixodes.csv</a>; 
<a href="./Ixodida-standardized-v2.csv" target="_blank">Ixodida-standardized-v2.csv</a>; 
<a href="./Ixodida-v2-symbiota.csv" target="_blank">Ixodida-v2-symbiota.csv</a><br />
Source: US National Tick Collection; Georgia Southern University<br />
Source Contact: <a href="http://lorenzabeati.klacto.net/" target="_blank">Dr. Lorenza Beati</a><br />
Taxonomic Resource Contact: <a href="https://github.com/njdowdy" target="_blank">@njdowdy</a><br />
Description: A list of Ixodes<br />
Status: DarwinCore compliant; no synonyms provided<br />

## Phthiraptera
Filename: <a href="./phthiraptera.csv" target="_blank">phthiraptera.csv</a>; 
<a href="./Phthiraptera-standardized-v2.csv" target="_blank">Phthiraptera-standardized-v2.csv</a>; 
<a href="./Phthiraptera-v2-symbiota.csv" target="_blank">Phthiraptera-v2-symbiota.csv</a><br />
Source: TPT Louse Team<br />
Source Contact: <a href="https://www.unr.edu/biology/faculty/julie-allen" target="_blank">Dr. Julie Allen</a><br />
Taxonomic Resource Contact: <a href="https://github.com/vijaybarve" target="_blank">@vijaybarve</a><br />
Description: A list of phthirapteran names<br />
Status: Partial DarwinCore compliance; TaxoList format<br />

## Siphonaptera
Filename: <a href="./siphonaptera.csv" target="_blank">siphonaptera.csv</a>; 
<a href="./Siphonaptera-standardized-v2.csv" target="_blank">Siphonaptera-standardized-v2.csv</a>; 
<a href="./Siphonaptera-v2-symbiota.csv" target="_blank">Siphonaptera-v2-symbiota.csv</a><br />
Source: <a href="https://biology.byu.edu/fleas-of-the-world" target="_blank">Fleas of the World Database</a>; Brigham Young University<br />
Source Contact: <a href="https://mlbean.byu.edu/curators-and-collection-managers" target="_blank">Michael Hastriter</a><br />
Taxonomic Resource Contact: <a href="https://github.com/Jegelewicz" target="_blank">@Jegelewicz</a><br />
Description: A list of siphonateran names<br />
Status: DarwinCore compliant<br />

# Host Taxa

## Aves
Filename: <a href="./aves.csv" target="_blank">aves.csv</a>; 
<a href="./Aves-standardized-v2.csv" target="_blank">Aves-standardized-v2.csv</a>; 
<a href="./Aves-v2-symbiota.csv" target="_blank">Aves-v2-symbiota.csv</a><br />
Source: [IOC World Bird](https://www.worldbirdnames.org/new/) <br />
Source Contact:<br />
Taxonomic Resource Contact: <a href="https://github.com/vijaybarve" target="_blank">@vijaybarve</a><br />
Description: A list of avian names<br />
Status: Partial DarwinCore compliance; no synonyms<br />

## Mammalia
Filename: <a href="./mammalia.csv" target="_blank">mammalia.csv</a>; 
<a href="./Mammalia-standardized-v2.csv" target="_blank">Mammalia-standardized-v2.csv</a>; 
<a href="./Mammalia-v2-symbiota.csv" target="_blank">Mammalia-v2-symbiota.csv</a>
<br />
Source: [ASM Mammal Diversity Database](https://www.mammaldiversity.org/) <br />
Source Contact:<br />
Taxonomic Resource Contact: <a href="https://github.com/vijaybarve" target="_blank">@vijaybarve</a><br />
Description: A list of mammalian names<br />
Status: Partial DarwinCore compliance; no synonyms<br />

---

This page can also be linked to using this address: https://bit.ly/TPTresourceHub

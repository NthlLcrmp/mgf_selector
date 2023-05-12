# Selection of features of interest in mgf file
## Problem
After preprocessing LC-HRMS/MS data with MZmine 3, the software allows the export of the complete feature list to SIRIUS (as mgf file). However, this list contains usually thousands of features, most of which are not discriminating the sample classes, and requires several days to analyze with SIRIUS. 
## Solution
From the mgf file exported from MZmine 3 and a csv file exported from MetaboAnalyst containing only the features of interest, this program allows to create a mgf file containing only the features of interest for futher processing with SIRIUS.
## Requirements
###	Exporting mgf file for SIRIUS from MZmine 3 
From MZmine 3 export the mgf file for SIRIUS by clicking on Feature list methods > Export feature list > SIRIUS / CSI-FingerID. Follow the instructions in the dialog box to perform the export. Be careful when using SIRIUS, it is better to uncheck the option "Merge MS/MS".
Please, note the path of the output file.
###	Exporting csv file for MetaboAnalyst from MZmine 3
From MZmine 3 export the csv file for MetaboAnalyst by clicking on Feature list methods > Export feature list > Statistics export (MetaboAnalyst). On MetaboAnalyst, perform the appropriate statistical processing to select the features of interest and export the results as csv file.
The file must contain the features identified in the format "6415/160.0967mz/9.20min" in the first column. It is imperative that the IDs of the features correspond to those of the mgf file.
# How to use
Run the program by opening the file mgf_selector.exe.
The program opens a command prompt.

![image](https://github.com/NthlLcrmp/mgf_selector/assets/114736047/90524733-dd31-4087-9dc5-8d78fd27b0be)

Paste the path of the complete mgf file to be modified and press ENTER. The program displays the number of features in the file.

![image](https://github.com/NthlLcrmp/mgf_selector/assets/114736047/9ccf9472-0006-4748-a17e-13b0de60842a)

Paste the path to the csv file containing the IDs of the features of interest and press ENTER. The program displays the number of features to select.

![image](https://github.com/NthlLcrmp/mgf_selector/assets/114736047/b903ff8b-fab9-44b5-b1e2-6550e0cd1c70)

Paste the path of the mgf file to create, that will contain only the features of interest and press ENTER. The program will close when the file is created.
## Contribution
All the contributions are welcome. Feel free to contact: nathalie.lacrampe1@gmail.com

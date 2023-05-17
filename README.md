# RFW-Practice
This is repo is to collaborate for test script development

################ COMMIT NOTES ################

Used RFW with VSCode 
Extensions used: Robot Framework Language Server, Python [VSCode extensions]

Python packages & Versions used:
robotframework==6.0.2
robotframework-seleniumlibrary==6.1.0
selenium==4.9.1
Pillow
PyYaml
robotframework-pabot


**Commands to run via CLI :**

Multiple config file: Format
robot -A <args file> --variable <attribute>:<value> <filename.robot>

**Example**
robot -A firefox_env.args --variable browser:EDGE . 
  
**Custom timestamped outputs**
  
  -T - Timestamps
  -o - Outputs (XML)
  -l - Logs
  -r - Report 
  
**Argument format**
  robot -T -o <outputName>.xml -l <logName>.html -r <reportName>.html <filename>.robot
  
**Example**
  robot -T -o MyOutput.xml -l MyLog.html -r MyReport.html .
  
**Parallel execution**
pabot --<splitLevel> <filename.robot>
  
**Example**
  pabot --testlevelsplit .
  
  
**Screenshot library requires Pillow library
  Take Screenshot   <Directory><filename>.<format>

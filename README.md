Repo collaboration for test script development
python packages and version:
    robotframework==6.0.2 robotframework-seleniumlibrary==6.1.0 selenium==4.9.1 Pillow PyYaml robotframework-pabot
    
    Multiple config file: Format robot -A --variable : <filename.robot>
    Generate Testcase:Screenshot library-using robot screenshot keyword Take Screenshot pathName.
    parallel excecution:pabot -- <filename.robot> 1.eg:pabot --testlevelsplit.
    config files and pass arguments:use command robot -A .args filename TestCaseName[.robot fileName] robot -A .args filename --variable browserName: Firefox TestCaseName[.robot fileName]
    

#Creates a Typescript source and test file with boilerplate code
# Type the name as you would like it to appear for the SOURCE file, NOT the directory name
param([string]$fileName)
    $dirNameFirstLetter = $fileName.Substring(0, 1);
    $dirNameRemainder = $fileName.Substring(1, $fileName.Length - 1);

New-Item -Path (".\$dirNameFirstLetter".ToLower() + "$dirNameRemainder") -ItemType Directory
New-Item -Path ".\$fileName\$fileName.ts" -ItemType File
New-Item -Path ".\$fileName\$fileName.spec.ts" -ItemType File

$fileName = $fileName.Substring(2);
$sourceFileContent = 
"export class $fileName {

}

" | Out-File -FilePath ".\$fileName\$fileName.ts"
$testFileContent = 
"
import { $fileName } from './$fileName';

describe('$fileName', () => {
    let instance: $fileName;

    beforeEach(() => {
        instance = new $fileName();
    });

    it('should', () => {

    });
});

" | Out-File -FilePath ".\$fileName\$fileName.spec.ts"
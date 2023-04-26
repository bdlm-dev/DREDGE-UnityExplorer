# ----------- Standalone Mono -----------
dotnet build src/UnityExplorer.sln -c Release_STANDALONE_Mono
$Path = "Release/UnityExplorer.Standalone.Mono"
# ILRepack
lib/ILRepack.exe /target:library /lib:lib/net35 /lib:$Path /internalize /out:$Path/UnityExplorer.Standalone.Mono.dll $Path/UnityExplorer.Standalone.Mono.dll $Path/mcs.dll $Path/Tomlet.dll
# (cleanup and move files)
Remove-Item $Path/Tomlet.dll
Remove-Item $Path/mcs.dll
Remove-Item $Path/../UnityExplorer.Standalone.Mono.zip -ErrorAction SilentlyContinue
7z a $Path/../UnityExplorer.Standalone.Mono.zip .\$Path\*
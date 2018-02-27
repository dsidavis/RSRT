
# 

```r
library(RSRT)
f = system.file("sampleDocs", "CHG05Apr2015_803.srt", package = "RSRT")
df = readSRT(f, encoding = "UTF-16")
vals = xpnd(df)
```

# Multiple Files

```r
fileNames = list.files("Acessible files_SRT", full.names = TRUE)
```

```
dfs = lapply(fileNames, readSRT, encoding = "UTF-16")
```

```
vals = lapply(dfs, xpnd)
```


#
See explore.R for finding the files and rows that
do not have 7 values.

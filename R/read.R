readSRT =
function(file, text = readLines(file, ...), ...)
{
    g = cumsum(grepl("^[[:space:]]*$", text))
    structure(do.call(rbind, tapply(text, g, readStanza)), class = c("SRT", "data.frame"))
}

print.SRT =
function(x, ...)    
{
    o = options()
    on.exit(options(o))
    options(digits.secs = 4)
    NextMethod('print')
}

readStanza =
function(ll)
{
    if(all(ll == ""))
       return(NULL)
    
    tm = grep("^([0-9]{2}:?){3}", ll)
    if(length(tm) == 0)
        stop("No time information")

    time = ll[tm]
    txt = ll[ - seq(1, tm) ]
    els = strsplit(time, "-?->")[[1]]
    
    data.frame(text = paste(txt, collapse = "\n"),
               start = getTime(els[1]), end = getTime(els[2]),
               stringsAsFactors = FALSE)
}

getTime =
function(x)
{
    as.POSIXct(strptime(gsub(",", ".", x), "%H:%M:%OS"))
}

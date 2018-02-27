# Expand text, start, end into  a dataframe
# of 8 variable

xpnd =
function(df)
{
    g = cumsum(grepl("^(Start|End);", df$text))
    ans = by(df, g, aggData)
    do.call(rbind, ans[ !sapply(ans, is.null) ])
}

aggData =
function(x)
{
    vals = grep("^[U0-9]", x$text, value = TRUE)
    hasComment = grepl("; *#", vals)
    comments = rep(as.character(NA), length(vals))
    comments[hasComment] = gsub(".*; *#(.*)", "\\1", vals[hasComment])
    vals[hasComment] = gsub("; *#.*", "", vals[hasComment])

    if(length(vals) == 0)
       return(NULL)
        
    m2 = mkVars(vals)
    m2$comments = comments

    n = nrow(m2)
    m2$end = rep(x$end[1], n)
    m2$start = rep(x$start[1], n)    
    
    m2
}

mkVars =
function(vals, els = strsplit(vals, ";"))
{
    i = sapply(els, length) != 7
    if(any(i)) 
       warning(sum(i), ' lines do not have 7 values')

    m = matrix(unlist(els),,7, byrow = TRUE)    
    m2 = as.data.frame(m)    
    names(m2) = c("ID", "BH", "angle1", "angle2", "stake", "x", "y")    

    fixNumVals(m2)
}

fixNumVals =
function(m2, vars = c("angle1", "angle2", "x", "y")    )
{
    m2[vars] = lapply(m2[vars], as.numeric)
    m2    
}

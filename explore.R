
# Ignore for now
#m = matrix(unlist(strsplit(grep("803;", a$text, value = TRUE), ";")), , 7, byrow = TRUE)



# Exploring the text with the identifiers to see how many fields there are.
files = list.files( full = TRUE)
ff = lapply(files, readSRT, encoding = "UTF-16")

# Get all the text and ignore which file it comes from.
at = unlist(lapply(ff, `[[`, "text"))
fileName = rep(files, sapply(ff, nrow))

# Starts with a digit.  Implies an ID.
dat = grepl("^[U0-9]", at)

hasComment = grepl("; *#", dat)

els = strsplit(dat, ";")
len = sapply(els, length)

table(len == 8, hasComment)

table(len == 7)
dat[ len != 7 ]


comments = gsub(".*; *#(.*)$", "\\1", dat)
    xtmp = dat
# Get rid of the comments so they don't count against the 7
dat = gsub("; *#", "", dat)

# Here identifies the lines with != 7 elements
els = strsplit(dat, ";")
len = sapply(els, length)

which(len != 7)
dat[which(len != 7)]
# Get the corresponding file names.


trim = function (x) 
gsub("(^[[:space:]]+|[[:space:]]+$)", "", x)


# After fixing by hand the 155 that have problems....
# But for now let's just focus on those with exactly 7 (having removed the comment)
tmp = dat[len == 7]
els = strsplit(tmp, ";")
m = matrix(trim(unlist(els)), , 7, byrow = TRUE)

m2 = as.data.frame(m)
names(m2) = c("ID", "BH", "angle1", "angle2", "stake", "x", "y")

nv = c(3:4, 6:7)
m2[nv] = lapply(m2[nv], as.numeric)



###
# Assemble the start and end.

f = "CHG05Apr2015_803.srt"
a = readSRT(f, encoding = "UTF-16")



aggData =
function(x)
{
    vals = grep("^[U0-9]", x, value = TRUE)
}



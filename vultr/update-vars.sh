awk '/^variable/{gsub("\"",""); print $2 "=\"\""}' variables.tf

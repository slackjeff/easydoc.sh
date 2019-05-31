#!/bin/sh
#==============================HEADER=================================|
#AUTOR
# Jefferson Rocha <root@slackjeff.com.br>
#
# Create a simple Website for Documentation, used in softwares.
#=====================================================================|

#=============================| FUNCTIONS
_CREATE_DOC()
{
    local title="$1"
    local desc="$2"
    
    cat > "index.html" <<EOF
<!--
	Created with easydoc.sh
	https://easydoc.github.io
-->
<!DOCTYPE html>
<html>
<head>
	<title>$title</title>
  	<meta charset="utf-8">
  	<style>
	  		body{
	  			font-family: courier new; 
	  			margin-left: 4%; margin-right: 4%;
	  			margin: 1em auto; max-width: 55em;
	  			color: #2a2a2a;
	  		}

	  		header{
	  			text-align: center;
	  		}

	  		pre{
	  			background-color: #e3e3e3; padding: 2%;
	  			border-radius: 5px;
	  			box-shadow: 1px 2px 3px #cacaca;
	  		}

	  		hr{
	  			border: 1px dashed; color: #c7c7c7;
	  			margin-top: 4%; margin-bottom: 4%;
	  		}

	  		footer{
	  			text-align: center;
	  			margin-top: 6%;
	  		}
  	</style>
</head>
<body>
<div id="main">
		<header>
			<h1>$title</h1>
			<p>$desc</p>
		</header>
		<hr>

	<h2>Index</h2>
	<ul>
		<li>Example 1</li>
		<li>Example 2</li>
		<li>Example 3</li>
		<li>Example 4</li>
	<ul>
		<li>Example 5.1</li>
		<li>Example 5.2</li>
		<li>Example 5.3</li>
	</ul>
		<li>Example 6</li>
		<li>Example 7</li>
		<li>Example 8</li>
	</ul>

<pre>
<b>Code Block, use 'pre' tag</b>
if [[ "blue" = "red"]]; then
    _print "red"
fi
</pre>

<footer>
	Update: $(date +%d/%m/%Y)
</footer>
</div>
</body>
</html>
EOF
}

#=============================| MAIN
case ${1} in
    -c|create)
        read -p "Document Title: " doc_title
        [ -z "$doc_title" ] && { echo "And title? Null?"; exit 1 ;}
        read -p "Small Document Description: " doc_desc
        [ -z "$doc_desc" ] && { echo "Pass a Small Description."; exit 1 ;}
        _CREATE_DOC "$doc_title" "$doc_desc"
        echo "Created index.html"
    ;;

    *) echo "Use -c or create" ;;
esac
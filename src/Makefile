javascript:
	elm make HomePage.elm --output=main.js

index:
	@elm make HomePage.elm
	@awk 'NR==7{print "  <link rel=\"stylesheet\" href=\"pg1.css\">"}1' index.html > newIndex.html
	@awk 'NR==4{print $0}' index.html  

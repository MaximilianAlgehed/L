
all:
	bnfc -d L.cf && cd L && alex Lex.x && happy Par.y && cd ..
	-rm L/*.x
	-rm L/*.y
	-rm L/*.bak
	-rm L/Test.hs
	-rm L/Doc.txt

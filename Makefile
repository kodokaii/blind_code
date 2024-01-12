CLONE       	= git clone --depth=1
RM				= rm -f
CP				= cp -rf

GRADEME			= grademe

EDITOR 			= editor
EDITOR_EXEC		= $(EDITOR)/kdo_editor
BIN_DIRECTORY	= ~/bin
EDITOR_INSTALL 	= $(BIN_DIRECTORY)/42editor

all: $(EDITOR_INSTALL) $(GRADEME)

$(GRADEME): 
	$(CLONE) https://github.com/JCluzet/42_EXAM.git $(GRADEME)

$(EDITOR_INSTALL): $(EDITOR_EXEC) $(BIN_DIRECTORY)
	$(CP) $(EDITOR_EXEC) $(EDITOR_INSTALL)

$(BIN_DIRECTORY):
	mkdir $(BIN_DIRECTORY)	

$(EDITOR_EXEC): $(EDITOR)
	$(MAKE) -C $(EDITOR)

$(EDITOR): 
	$(CLONE) https://github.com/kodokaii/kdo_editor.git $(EDITOR)

clean:
	if [ -d "$(EDITOR)" ]; then $(MAKE) clean -C $(EDITOR); fi

fclean: clean
	$(RM) $(EDITOR_EXEC)

clear: fclean
	$(RM) -r $(EDITOR)
	$(RM) -r $(GRADEME)
	$(RM) $(EDITOR_INSTALL)

re: fclean all

.PHONY:		all bonus clear clean fclean re

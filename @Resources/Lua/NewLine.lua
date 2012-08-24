function Initialize()

	vNotes = SKIN:ReplaceVariables("#Notes#");
	vNewLine = SKIN:ReplaceVariables("#NLSign#");


end -- function Initialize


function Update()

	NewNotes = string.gsub(vNotes, vNewLine, "\n")
	SKIN:Bang('!SetOption', "Notes", 'Text', NewNotes)
end -- function Update
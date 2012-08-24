function Initialize()

	vNotes = SKIN:GetVariable("NoteNotes");
	vNewLine = SKIN:GetVariable("NoteNLSign");
	print(vNotes)

end -- function Initialize


function Update()

	NewNotes = string.gsub(vNotes, vNewLine, "\n")
	SKIN:Bang('!SetOption', "Notes", 'Text', NewNotes)
end -- function Update
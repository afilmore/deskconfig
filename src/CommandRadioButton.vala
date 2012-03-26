/***********************************************************************************************************************
 * CommandRadioButton.vala
 * 
 * Copyright 2012 Axel FILMORE <axel.filmore@gmail.com>
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License Version 2.
 * http://www.gnu.org/licenses/gpl-2.0.txt
 * 
 * Purpose: 
 * 
 **********************************************************************************************************************/

public class CommandRadioButton : Gtk.RadioButton {
    
    private string _commandline;

    public void set_command_line (string commandline) {
        _commandline = commandline;
    }
    
    public string get_command_line () {
        return _commandline;
    }

}



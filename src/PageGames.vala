/***********************************************************************************************************************
 * PageGames.vala
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

public class PageGames : PageBase {
    
    
    public PageGames () {
        
        _type = Gtk.AssistantPageType.CONTENT;
        _title = "Games";
        _complete = true;
        
        _box = new Gtk.Box (Gtk.Orientation.VERTICAL, 5);
        
        CommandCheckButton chk1 = new CommandCheckButton ();
        chk1.label = "Gnect";
        chk1.set_command_line ("gnec");
        chk1.set_active (true);
        _box.pack_start (chk1, false, false, 5);
        
    }

    public override string get_command_line () {
        
        string ret = "apt-get -yq install";
        _box.foreach ( (wgt) => {
            CommandCheckButton chk = wgt as CommandCheckButton;

            if (chk.get_active ()) {
                ret += " ";
                ret += chk.get_command_line ();
            }
        });
        
        return ret;
    }

}


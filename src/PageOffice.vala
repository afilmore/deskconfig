/***********************************************************************************************************************
 * PageOffice.vala
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

public class PageOffice : PageBase {
    
    
    public PageOffice () {
        
        _type = Gtk.AssistantPageType.CONTENT;
        _title = "Office";
        _complete = true;
        
        _box = new Gtk.Box (Gtk.Orientation.VERTICAL, 5);
        
        CommandCheckButton chk1 = new CommandCheckButton ();
        chk1.label = "Abiword";
        chk1.set_command_line ("abiword");
        chk1.set_active (true);
        _box.pack_start (chk1, false, false, 5);
        
        CommandCheckButton chk2 = new CommandCheckButton ();
        chk2.label = "Gnumeric";
        chk2.set_command_line ("gnumeric");
        chk2.set_active (true);
        _box.pack_start (chk2, false, false, 5);

        CommandCheckButton chk3 = new CommandCheckButton ();
        chk3.label = "LibreOffice";
        chk3.set_command_line ("libreoffice");
        _box.pack_start (chk3, false, false, 5);
        
        CommandCheckButton chk4 = new CommandCheckButton ();
        chk4.label = "Doc Viewer";
        chk4.set_command_line ("docviewer");
        chk4.set_active (true);
        _box.pack_start (chk4, false, false, 5);

        CommandCheckButton chk5 = new CommandCheckButton ();
        chk5.label = "Gnumeric";
        chk5.set_command_line ("gnumeric");
        chk5.set_active (true);
        _box.pack_start (chk5, false, false, 5);

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


/***********************************************************************************************************************
 * PageMultimedia.vala
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

public class PageMultimedia : PageBase {
    
    
    public PageMultimedia () {
        
        _type = Gtk.AssistantPageType.CONTENT;
        _title = "Multimedia";
        _complete = true;
        
        _box = new Gtk.Box (Gtk.Orientation.VERTICAL, 5);
        
        CommandCheckButton chk1 = new CommandCheckButton ();
        chk1.label = "Audacious (Default)";
        chk1.set_command_line ("audacious");
        chk1.set_active (true);
        _box.pack_start (chk1, false, false, 5);
        
        CommandCheckButton chk2 = new CommandCheckButton ();
        chk2.label = "GNOME Player";
        chk2.set_command_line ("gnome-player");
        chk2.set_active (true);
        _box.pack_start (chk2, false, false, 5);

        CommandCheckButton chk3 = new CommandCheckButton ();
        chk3.label = "XFBurn";
        chk3.set_command_line ("xfburn");
        chk3.set_active (true);
        _box.pack_start (chk3, false, false, 5);
        
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

